import '../unleashing_grpc.dart';

/// A mock implementation of [MachineControlServiceBase].
class MockMachineControlService extends MachineControlServiceBase {
  @override
  Future<Empty> setLedState(
    final ServiceCall call,
    final SetLedStateRequest request,
  ) async {
    return Empty();
  }
}
