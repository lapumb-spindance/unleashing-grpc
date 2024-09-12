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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');

@$core.Deprecated('Use ledStateDescriptor instead')
const LedState$json = {
  '1': 'LedState',
  '2': [
    {'1': 'ledOn', '3': 1, '4': 1, '5': 8, '10': 'ledOn'},
  ],
};

/// Descriptor for `LedState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledStateDescriptor =
    $convert.base64Decode('CghMZWRTdGF0ZRIUCgVsZWRPbhgBIAEoCFIFbGVkT24=');

@$core.Deprecated('Use ledInfoDescriptor instead')
const LedInfo$json = {
  '1': 'LedInfo',
  '2': [
    {'1': 'pin', '3': 1, '4': 1, '5': 5, '10': 'pin'},
    {'1': 'info', '3': 2, '4': 1, '5': 9, '10': 'info'},
    {'1': 'ledOn', '3': 3, '4': 1, '5': 8, '10': 'ledOn'},
  ],
};

/// Descriptor for `LedInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledInfoDescriptor = $convert.base64Decode(
    'CgdMZWRJbmZvEhAKA3BpbhgBIAEoBVIDcGluEhIKBGluZm8YAiABKAlSBGluZm8SFAoFbGVkT2'
    '4YAyABKAhSBWxlZE9u');
