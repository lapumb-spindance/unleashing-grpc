import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

import '../locator.dart';

class LedStatusViewModel extends ChangeNotifier {
  final Logger _logger = Logger('LedStatusViewModel');

  final MachineControlGrpcClient _client =
      locator.get<MachineControlGrpcClient>();

  /// The current LED status.
  bool get ledStatus => _ledStatus;
  bool _ledStatus = false;

  /// The current LED info.
  String get ledInfo => _ledInfo;
  String _ledInfo = 'Unknown';

  LedStatusViewModel() {
    Timer.periodic(const Duration(seconds: 2), (final Timer timer) {
      try {
        _getInitialInfo();
        timer.cancel();
      } catch (e) {
        _logger.severe('Error getting initial info: $e');
      }
    });

    _streamLedState();
  }

  /// Set the LED status via gRPC.
  void setLedStatus(final bool value) async {
    try {
      // Note: we are not updating the local state here, as we are listening to
      // the stream of LED states (we do not want to accidentally get out of sync).
      await _client.setLedState(value);
    } catch (e) {
      _logger.severe('Error setting LED status: $e');
    }
  }

  /// Get the LED status via gRPC.
  void _getInitialInfo() async {
    final LedInfo info = await _client.getLedInfo();
    _ledStatus = info.ledOn;
    _ledInfo = 'Selected pin: ${info.pin}:\n${info.info}';
    notifyListeners();
  }

  void _streamLedState() {
    _logger.info('Starting to stream LED state..');

    _client.streamLedState().listen(
      (final LedState state) {
        _ledStatus = state.ledOn;
        notifyListeners();
      },
      cancelOnError: true,
    ).onError((final Object error, final StackTrace stackTrace) async {
      _logger.severe('Error streaming LED state: $error', error, stackTrace);
      await Future<void>.delayed(const Duration(seconds: 5), _streamLedState);
    });
  }
}
