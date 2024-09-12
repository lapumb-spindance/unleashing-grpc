import 'package:dart_periphery/dart_periphery.dart';
import 'package:logging/logging.dart';

/// The abstract base class for machine control.
abstract interface class MachineControlBase {
  void init(final int gpioPin);
  void dispose();
  void setLedState(final bool ledOn);
}

/// A stub implementation of [MachineControlBase].
class MockMachineControl implements MachineControlBase {
  final Logger _logger = Logger('MockMachineControl');

  @override
  void init(final int gpioPin) {
    _logger.info('Initializing mock GPIO pin $gpioPin');
  }

  @override
  void dispose() {
    _logger.info('Disposing mock GPIO');
  }

  @override
  void setLedState(final bool ledOn) {
    _logger.info('Setting (mock) LED state to ${ledOn ? 'on' : 'off'}');
  }
}

/// The machine control implementation.
class MachineControl implements MachineControlBase {
  final Logger _logger = Logger('MachineControl');
  late final GPIO _gpio;

  @override
  void init(final int gpioPin) {
    _logger.info('Initializing GPIO pin $gpioPin');

    _gpio = GPIO(gpioPin, GPIOdirection.gpioDirOut);

    _logger.fine('GPIO Info: ${_gpio.getGPIOinfo()}');
  }

  @override
  void dispose() {
    _logger.info('Disposing GPIO');

    _gpio.dispose();
  }

  @override
  void setLedState(final bool ledOn) {
    _logger.info('Setting LED state to ${ledOn ? 'on' : 'off'}');
    _gpio.write(ledOn);
  }
}
