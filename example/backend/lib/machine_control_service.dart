import 'machine_control.dart';
import 'package:unleashing_grpc/unleashing_grpc.dart';

class MachineControlService extends MachineControlServiceBase {
  late final MachineControlBase _machineControl;

  MachineControlService(final MachineControlBase machineControl) {
    _machineControl = machineControl;
  }

  @override
  Future<Empty> setLedState(
    final ServiceCall call,
    final SetLedStateRequest request,
  ) async {
    _machineControl.setLedState(request.ledOn);

    return Empty();
  }
}
