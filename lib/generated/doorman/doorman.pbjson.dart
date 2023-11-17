//
//  Generated code. Do not modify.
//  source: doorman.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use accessCheckRequestDescriptor instead')
const AccessCheckRequest$json = {
  '1': 'AccessCheckRequest',
  '2': [
    {'1': 'challenge', '3': 1, '4': 1, '5': 9, '10': 'challenge'},
  ],
};

/// Descriptor for `AccessCheckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessCheckRequestDescriptor = $convert.base64Decode(
    'ChJBY2Nlc3NDaGVja1JlcXVlc3QSHAoJY2hhbGxlbmdlGAEgASgJUgljaGFsbGVuZ2U=');

@$core.Deprecated('Use doorOpenRequestDescriptor instead')
const DoorOpenRequest$json = {
  '1': 'DoorOpenRequest',
  '2': [
    {'1': 'challenge', '3': 1, '4': 1, '5': 9, '10': 'challenge'},
  ],
};

/// Descriptor for `DoorOpenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doorOpenRequestDescriptor = $convert.base64Decode(
    'Cg9Eb29yT3BlblJlcXVlc3QSHAoJY2hhbGxlbmdlGAEgASgJUgljaGFsbGVuZ2U=');

@$core.Deprecated('Use accessCheckResponseDescriptor instead')
const AccessCheckResponse$json = {
  '1': 'AccessCheckResponse',
  '2': [
    {'1': 'has_access', '3': 1, '4': 1, '5': 8, '10': 'hasAccess'},
    {'1': 'is_fuks', '3': 2, '4': 1, '5': 8, '10': 'isFuks'},
    {'1': 'is_active_fuks', '3': 3, '4': 1, '5': 8, '10': 'isActiveFuks'},
  ],
};

/// Descriptor for `AccessCheckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessCheckResponseDescriptor = $convert.base64Decode(
    'ChNBY2Nlc3NDaGVja1Jlc3BvbnNlEh0KCmhhc19hY2Nlc3MYASABKAhSCWhhc0FjY2VzcxIXCg'
    'dpc19mdWtzGAIgASgIUgZpc0Z1a3MSJAoOaXNfYWN0aXZlX2Z1a3MYAyABKAhSDGlzQWN0aXZl'
    'RnVrcw==');

@$core.Deprecated('Use doorOpenResponseDescriptor instead')
const DoorOpenResponse$json = {
  '1': 'DoorOpenResponse',
  '2': [
    {'1': 'open', '3': 1, '4': 1, '5': 8, '10': 'open'},
    {'1': 'open_duration', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'openDuration'},
  ],
};

/// Descriptor for `DoorOpenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doorOpenResponseDescriptor = $convert.base64Decode(
    'ChBEb29yT3BlblJlc3BvbnNlEhIKBG9wZW4YASABKAhSBG9wZW4SPgoNb3Blbl9kdXJhdGlvbh'
    'gCIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIMb3BlbkR1cmF0aW9u');

