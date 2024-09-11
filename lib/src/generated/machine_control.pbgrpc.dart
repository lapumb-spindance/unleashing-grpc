// coverage:ignore-file
//
//  Generated code. Do not modify.
//  source: machine_control.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'machine_control.pb.dart' as $0;

export 'machine_control.pb.dart';

@$pb.GrpcServiceName('machine_control.MachineControl')
class MachineControlClient extends $grpc.Client {
  static final _$setLedState =
      $grpc.ClientMethod<$0.SetLedStateRequest, $0.Empty>(
          '/machine_control.MachineControl/SetLedState',
          ($0.SetLedStateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  MachineControlClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> setLedState($0.SetLedStateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setLedState, request, options: options);
  }
}

@$pb.GrpcServiceName('machine_control.MachineControl')
abstract class MachineControlServiceBase extends $grpc.Service {
  $core.String get $name => 'machine_control.MachineControl';

  MachineControlServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SetLedStateRequest, $0.Empty>(
        'SetLedState',
        setLedState_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetLedStateRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> setLedState_Pre($grpc.ServiceCall call,
      $async.Future<$0.SetLedStateRequest> request) async {
    return setLedState(call, await request);
  }

  $async.Future<$0.Empty> setLedState(
      $grpc.ServiceCall call, $0.SetLedStateRequest request);
}
