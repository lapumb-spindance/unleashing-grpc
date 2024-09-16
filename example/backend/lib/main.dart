import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/widgets.dart';

import 'package:logging/logging.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

import 'machine_control.dart';
import 'machine_control_service.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((final LogRecord record) {
    String start = '\x1b[0m';
    const String reset = '\x1b[0m';

    switch (record.level) {
      case Level.FINEST:
      case Level.FINER:
        // Grey.
        start = '\x1b[90m';
      case Level.FINE:
      case Level.CONFIG:
        // White.
        start = '\x1b[97m';
      case Level.INFO:
        // Green.
        start = '\x1b[32m';
      case Level.WARNING:
        // Yellow.
        start = '\x1b[33m';
      case Level.SEVERE:
        // Red.
        start = '\x1b[31m';
      case Level.SHOUT:
        start = '\x1b[41m\x1b[93m';
    }

    stdout.writeln(
      '$start(${record.time.toLocal()}) ${record.loggerName}(${record.level.name}): ${record.message}$reset',
    );
  });
}

void main() async {
  _setupLogging();

  final Logger logger = Logger('main');

  WidgetsFlutterBinding.ensureInitialized();

  // Create and start the gRPC server. The actual machine control is only supported
  // on Linux (since we are calling into GPIO functionality). If we are running on
  // a different platform, we will use the mock implementation.
  final MachineControlBase machineControl;
  String hostname;
  int gpio;

  // Attempt to get the hostname and GPIO number from the environment.
  try {
    hostname =
        const String.fromEnvironment('HOSTNAME', defaultValue: 'localhost');
    gpio = int.parse(const String.fromEnvironment('GPIO', defaultValue: '6'));
  } on FormatException catch (e) {
    logger.severe('Failed to parse GPIO number: $e');
    exit(1);
  }

  final EventBus eventBus = EventBus();

  if (Platform.isLinux) {
    machineControl = MachineControl(gpio, eventBus);
  } else {
    machineControl = MockMachineControl(gpio, eventBus);
  }

  final MachineControlGrpcServer server = MachineControlGrpcServer(
    service: MachineControlService(machineControl, eventBus),
    hostname: hostname,
    logger: logger,
  );

  await server.start().then((final _) {
    logger.info('gRPC server started!');
  }).onError((final Object error, final StackTrace stackTrace) {
    logger.severe('Failed to start gRPC server: $error', error, stackTrace);
    machineControl.dispose();
    exit(1);
  });

  // Handle SIGINT (Ctrl+C) to stop the gRPC server and clean up.
  ProcessSignal.sigint.watch().listen((final ProcessSignal signal) async {
    logger.warning('Received signal $signal, stopping gRPC server...');

    await server.stop().then((final _) {
      logger.info('gRPC server stopped!');
    });

    machineControl.dispose();

    exit(0);
  });
}
