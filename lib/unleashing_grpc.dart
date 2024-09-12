library;

export 'package:grpc/grpc.dart' show ServiceCall, Service;

export 'src/generated/machine_control.pbgrpc.dart'
    show Empty, SetLedStateRequest, MachineControlServiceBase;
export 'src/machine_control_grpc_client.dart' show MachineControlGrpcClient;
export 'src/machine_control_grpc_server.dart' show MachineControlGrpcServer;
