import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

import 'generated/machine_control.pbgrpc.dart';

class MachineControlGrpcClient {
  /// The stub ('client') to call into.
  late final MachineControlClient _stub;

  /// The hostname of the gRPC server.
  final String hostname;

  /// The port of the gRPC server.
  final int port;

  /// The [Logger] to use.
  final Logger? logger;

  MachineControlGrpcClient({
    this.hostname = 'localhost',
    this.port = 8080,
    this.logger,
  }) {
    assert(hostname.isNotEmpty, 'hostname must not be empty');
    assert(port > 0, 'port must be greater than 0');

    _stub = MachineControlClient(
      ClientChannel(
        hostname,
        port: port,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  /// Set the [ledOn] state to on ([true]) or off ([false]).
  Future<void> setLedState(final bool ledOn) async {
    logger?.finest('Setting LED state to ${ledOn ? 'on' : 'off'}');

    await _stub.setLedState(LedState(ledOn: ledOn));
  }

  /// Get the LED GPIO info.
  Future<LedInfo> getLedInfo() async {
    logger?.finest('Getting LED info');

    return _stub.getLedInfo(Empty());
  }

  /// Stream the LED status.
  Stream<LedState> streamLedState() async* {
    logger?.finest('Streaming LED state');

    yield* _stub.streamLedState(Empty());
  }
}
