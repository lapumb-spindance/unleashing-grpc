import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

/// Global locator.
final GetIt locator = GetIt.instance;

void setup() {
  final String hostname = Platform.environment['HOSTNAME'] ?? 'localhost';

  locator.registerSingleton<MachineControlGrpcClient>(
    MachineControlGrpcClient(
      hostname: hostname,
      logger: Logger('MachineControlGrpcClient'),
    ),
  );
}
