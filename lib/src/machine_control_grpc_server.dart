import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

import 'generated/machine_control.pbgrpc.dart';

class MachineControlGrpcServer {
  late final Server _server;

  /// The hostname of the gRPC server.
  final String hostname;

  /// The port of the gRPC server.
  final int port;

  /// The implementation of [MachineControlServiceBase] to register with the
  /// server.
  final MachineControlServiceBase service;

  /// The [Logger] to use.
  final Logger? logger;

  MachineControlGrpcServer({
    required this.service,
    this.hostname = 'localhost',
    this.port = 8080,
    this.logger,
  }) {
    assert(hostname.isNotEmpty, 'hostname must not be empty');
    assert(port > 0, 'port must be greater than 0');

    _server = Server.create(services: <Service>[service]);
  }

  /// Start the gRPC server.
  Future<void> start() async {
    logger?.info('Starting gRPC server on $hostname:$port');

    await _server.serve(
      address: hostname,
      port: port,
    );
  }

  /// Stop the gRPC server.
  Future<void> stop() async {
    logger?.info('Stopping gRPC server on $hostname:$port');

    await _server.shutdown();
  }
}
