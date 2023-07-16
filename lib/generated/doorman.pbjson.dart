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

@$core.Deprecated('Use officePermissionDescriptor instead')
const OfficePermission$json = {
  '1': 'OfficePermission',
  '2': [
    {'1': 'has_access', '3': 1, '4': 1, '5': 8, '10': 'hasAccess'},
    {'1': 'is_fuks_member', '3': 2, '4': 1, '5': 8, '10': 'isFuksMember'},
    {'1': 'is_active_fuks', '3': 3, '4': 1, '5': 8, '10': 'isActiveFuks'},
  ],
};

/// Descriptor for `OfficePermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List officePermissionDescriptor = $convert.base64Decode(
    'ChBPZmZpY2VQZXJtaXNzaW9uEh0KCmhhc19hY2Nlc3MYASABKAhSCWhhc0FjY2VzcxIkCg5pc1'
    '9mdWtzX21lbWJlchgCIAEoCFIMaXNGdWtzTWVtYmVyEiQKDmlzX2FjdGl2ZV9mdWtzGAMgASgI'
    'Ugxpc0FjdGl2ZUZ1a3M=');

@$core.Deprecated('Use doorStateDescriptor instead')
const DoorState$json = {
  '1': 'DoorState',
  '2': [
    {'1': 'open', '3': 1, '4': 1, '5': 8, '10': 'open'},
    {'1': 'open_duration', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'openDuration'},
  ],
};

/// Descriptor for `DoorState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doorStateDescriptor = $convert.base64Decode(
    'CglEb29yU3RhdGUSEgoEb3BlbhgBIAEoCFIEb3BlbhI+Cg1vcGVuX2R1cmF0aW9uGAIgASgLMh'
    'kuZ29vZ2xlLnByb3RvYnVmLkR1cmF0aW9uUgxvcGVuRHVyYXRpb24=');

