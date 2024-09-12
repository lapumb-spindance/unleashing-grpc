import 'package:dart_periphery/dart_periphery.dart';
import 'package:event_bus/event_bus.dart';
import 'package:logging/logging.dart';

class LedStateEvent {
  final bool ledOn;

  LedStateEvent(this.ledOn);
}

/// The abstract base class for machine control.
abstract interface class MachineControlBase {
  MachineControlBase(final int gpioPin, final EventBus eventBus);
  int get gpioPin;
  void dispose();
  String getLedInfo();
  void setLedState(final bool ledOn);
  bool get ledState;
}

/// A stub implementation of [MachineControlBase].
class MockMachineControl implements MachineControlBase {
  final Logger _logger = Logger('MockMachineControl');
  late final EventBus _eventBus;
  late final int _gpioPin;
  bool _ledState = false;

  MockMachineControl(final int gpioPin, final EventBus eventBus) {
    _eventBus = eventBus;
    _gpioPin = gpioPin;
    _logger.info('Initializing mock GPIO pin $gpioPin');
  }

  @override
  int get gpioPin => _gpioPin;

  @override
  void dispose() {
    _logger.info('Disposing mock GPIO');
  }

  @override
  String getLedInfo() {
    return 'Unknown';
  }

  @override
  void setLedState(final bool ledOn) {
    _logger.info('Setting (mock) LED state to ${ledOn ? 'on' : 'off'}');
    _ledState = ledOn;
    _eventBus.fire(LedStateEvent(ledOn));
  }

  @override
  bool get ledState => _ledState;
}

/// The machine control implementation.
class MachineControl implements MachineControlBase {
  final Logger _logger = Logger('MachineControl');
  late final GPIO _gpio;
  late final EventBus _eventBus;

  MachineControl(final int gpioPin, final EventBus eventBus) {
    _eventBus = eventBus;

    _logger.info('Initializing GPIO pin $gpioPin');
    _gpio = GPIO(gpioPin, GPIOdirection.gpioDirOut);
  }

  @override
  int get gpioPin => _gpio.line;

  @override
  void dispose() {
    _logger.info('Disposing GPIO');

    _gpio.dispose();
  }

  @override
  String getLedInfo() {
    return 'GPIO Info: ${_gpio.getGPIOinfo()}\n';
  }

  @override
  void setLedState(final bool ledOn) {
    _logger.info('Setting LED state to ${ledOn ? 'on' : 'off'}');
    _gpio.write(ledOn);

    _eventBus.fire(LedStateEvent(ledOn));
  }

  @override
  bool get ledState => _gpio.read();
}
