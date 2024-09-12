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
  static final _$setLedState = $grpc.ClientMethod<$0.LedState, $0.Empty>(
      '/machine_control.MachineControl/SetLedState',
      ($0.LedState value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getLedInfo = $grpc.ClientMethod<$0.Empty, $0.LedInfo>(
      '/machine_control.MachineControl/GetLedInfo',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LedInfo.fromBuffer(value));
  static final _$streamLedState = $grpc.ClientMethod<$0.Empty, $0.LedState>(
      '/machine_control.MachineControl/StreamLedState',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LedState.fromBuffer(value));

  MachineControlClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Empty> setLedState($0.LedState request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setLedState, request, options: options);
  }

  $grpc.ResponseFuture<$0.LedInfo> getLedInfo($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLedInfo, request, options: options);
  }

  $grpc.ResponseStream<$0.LedState> streamLedState($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamLedState, $async.Stream.fromIterable([request]),
        options: options);
  }
}

@$pb.GrpcServiceName('machine_control.MachineControl')
abstract class MachineControlServiceBase extends $grpc.Service {
  $core.String get $name => 'machine_control.MachineControl';

  MachineControlServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LedState, $0.Empty>(
        'SetLedState',
        setLedState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LedState.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.LedInfo>(
        'GetLedInfo',
        getLedInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.LedInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.LedState>(
        'StreamLedState',
        streamLedState_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.LedState value) => value.writeToBuffer()));
  }

  $async.Future<$0.Empty> setLedState_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LedState> request) async {
    return setLedState(call, await request);
  }

  $async.Future<$0.LedInfo> getLedInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getLedInfo(call, await request);
  }

  $async.Stream<$0.LedState> streamLedState_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* streamLedState(call, await request);
  }

  $async.Future<$0.Empty> setLedState(
      $grpc.ServiceCall call, $0.LedState request);
  $async.Future<$0.LedInfo> getLedInfo(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$0.LedState> streamLedState(
      $grpc.ServiceCall call, $0.Empty request);
}
