import 'dart:io';

import 'package:flutter/material.dart';

import 'package:logging/logging.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

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

  // Connect to the gRPC server.
  final Logger logger = Logger('main');
  logger.info('Connecting to gRPC server');

  final String hostname = Platform.environment['HOSTNAME'] ?? 'localhost';

  final MachineControlGrpcClient grpcClient = MachineControlGrpcClient(
    hostname: hostname,
    logger: logger,
  );

  while (true) {
    try {
      await grpcClient.setLedState(true);
      await Future<void>.delayed(const Duration(seconds: 1));
      await grpcClient.setLedState(false);
      break;
    } catch (e, stackTrace) {
      logger.severe('Error setting LED state: $e, $stackTrace');
    }

    await Future<void>.delayed(const Duration(seconds: 1));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
