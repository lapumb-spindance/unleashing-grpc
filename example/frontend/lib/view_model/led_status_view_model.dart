import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

import '../locator.dart';

class LedStatusViewModel extends ChangeNotifier {
  final Logger _logger = Logger('LedStatusViewModel');

  final MachineControlGrpcClient _client =
      locator.get<MachineControlGrpcClient>();

  bool _ledStatus = false;
  bool get ledStatus => _ledStatus;

  /// Set the LED status via gRPC.
  void setLedStatus(final bool value) async {
    try {
      await _client.setLedState(value);
      _ledStatus = value;
      notifyListeners();
    } catch (e) {
      _logger.severe('Error setting LED status: $e');
    }
  }
}
