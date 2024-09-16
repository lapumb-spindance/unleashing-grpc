import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

import '../locator.dart';

class LedStateViewModel extends ChangeNotifier {
  final Logger _logger = Logger('LedStateViewModel');

  final MachineControlGrpcClient _client =
      locator.get<MachineControlGrpcClient>();

  /// The current LED state.
  bool get ledState => _ledState;
  bool _ledState = false;

  /// The current LED info.
  String get ledInfo => _ledInfo;
  String _ledInfo = 'Unknown';

  LedStateViewModel() {
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

  /// Set the LED state via gRPC.
  void setLedState(final bool value) async {
    try {
      // Note: we are not updating the local state here, as we are listening to
      // the stream of LED states (we do not want to accidentally get out of sync).
      await _client.setLedState(value);
    } catch (e) {
      _logger.severe('Error setting LED state: $e');
    }
  }

  void _getInitialInfo() async {
    final LedInfo info = await _client.getLedInfo();
    _ledState = info.ledOn;
    _ledInfo = 'Selected GPIO: ${info.gpioNum}:\n${info.info}';
    notifyListeners();
  }

  void _streamLedState() {
    _logger.info('Starting to stream LED state..');

    _client.streamLedState().listen(
          (final LedState state) {
            if (state.ledOn == _ledState) {
              return;
            }

            _ledState = state.ledOn;
            notifyListeners();
          },
          cancelOnError: true,
          onError: ((final Object error) async {
            _logger.severe(
              'Error streaming LED state: $error',
            );
            await Future<void>.delayed(
              const Duration(seconds: 5),
              _streamLedState,
            );
          }),
          onDone: () {
            _logger.warning('LED state stream done.');
            _streamLedState();
          },
        );
  }
}
