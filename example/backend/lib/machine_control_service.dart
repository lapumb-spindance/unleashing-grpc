import 'package:event_bus/event_bus.dart';

import 'machine_control.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

class MachineControlService extends MachineControlServiceBase {
  late final MachineControlBase _machineControl;
  late final EventBus _eventBus;

  MachineControlService(
    final MachineControlBase machineControl,
    final EventBus eventBus,
  ) {
    _machineControl = machineControl;
    _eventBus = eventBus;
  }

  @override
  Future<Empty> setLedState(
    final ServiceCall call,
    final LedState request,
  ) async {
    _machineControl.setLedState(request.ledOn);

    return Empty();
  }

  @override
  Future<LedInfo> getLedInfo(
    final ServiceCall call,
    final Empty request,
  ) async {
    return LedInfo(
      ledOn: _machineControl.ledState,
      info: _machineControl.getLedInfo(),
      gpioNum: _machineControl.gpioNum,
    );
  }

  @override
  Stream<LedState> streamLedState(
    final ServiceCall call,
    final Empty request,
  ) async* {
    yield* _eventBus.on<LedStateEvent>().map((final LedStateEvent event) {
      return LedState(ledOn: event.ledOn);
    });
  }
}
