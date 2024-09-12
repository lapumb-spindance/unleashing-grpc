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

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// An empty message. Ideally this would be a google.protobuf.Empty, but it is not available for Dart code generation.
class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Empty',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'machine_control'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

/// Request message for SetLedState.
class LedState extends $pb.GeneratedMessage {
  factory LedState({
    $core.bool? ledOn,
  }) {
    final $result = create();
    if (ledOn != null) {
      $result.ledOn = ledOn;
    }
    return $result;
  }
  LedState._() : super();
  factory LedState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LedState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LedState',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'machine_control'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ledOn', protoName: 'ledOn')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LedState clone() => LedState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LedState copyWith(void Function(LedState) updates) =>
      super.copyWith((message) => updates(message as LedState)) as LedState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LedState create() => LedState._();
  LedState createEmptyInstance() => create();
  static $pb.PbList<LedState> createRepeated() => $pb.PbList<LedState>();
  @$core.pragma('dart2js:noInline')
  static LedState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedState>(create);
  static LedState? _defaultInstance;

  /// The state to set the LED to.
  @$pb.TagNumber(1)
  $core.bool get ledOn => $_getBF(0);
  @$pb.TagNumber(1)
  set ledOn($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLedOn() => $_has(0);
  @$pb.TagNumber(1)
  void clearLedOn() => clearField(1);
}

/// String-ified info about the LED pin.
class LedInfo extends $pb.GeneratedMessage {
  factory LedInfo({
    $core.int? pin,
    $core.String? info,
    $core.bool? ledOn,
  }) {
    final $result = create();
    if (pin != null) {
      $result.pin = pin;
    }
    if (info != null) {
      $result.info = info;
    }
    if (ledOn != null) {
      $result.ledOn = ledOn;
    }
    return $result;
  }
  LedInfo._() : super();
  factory LedInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LedInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LedInfo',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'machine_control'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pin', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'info')
    ..aOB(3, _omitFieldNames ? '' : 'ledOn', protoName: 'ledOn')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LedInfo clone() => LedInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LedInfo copyWith(void Function(LedInfo) updates) =>
      super.copyWith((message) => updates(message as LedInfo)) as LedInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LedInfo create() => LedInfo._();
  LedInfo createEmptyInstance() => create();
  static $pb.PbList<LedInfo> createRepeated() => $pb.PbList<LedInfo>();
  @$core.pragma('dart2js:noInline')
  static LedInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedInfo>(create);
  static LedInfo? _defaultInstance;

  /// The pin number of the LED.
  @$pb.TagNumber(1)
  $core.int get pin => $_getIZ(0);
  @$pb.TagNumber(1)
  set pin($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPin() => $_has(0);
  @$pb.TagNumber(1)
  void clearPin() => clearField(1);

  /// General info.
  @$pb.TagNumber(2)
  $core.String get info => $_getSZ(1);
  @$pb.TagNumber(2)
  set info($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => clearField(2);

  /// The current state of the LED.
  @$pb.TagNumber(3)
  $core.bool get ledOn => $_getBF(2);
  @$pb.TagNumber(3)
  set ledOn($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLedOn() => $_has(2);
  @$pb.TagNumber(3)
  void clearLedOn() => clearField(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
