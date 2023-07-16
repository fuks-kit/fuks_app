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

@$core.Deprecated('Use organizationDescriptor instead')
const Organization$json = {
  '1': 'Organization',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'FUKS', '2': 1},
    {'1': 'VWI', '2': 2},
  ],
};

/// Descriptor for `Organization`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List organizationDescriptor = $convert.base64Decode(
    'CgxPcmdhbml6YXRpb24SCwoHVU5LTk9XThAAEggKBEZVS1MQARIHCgNWV0kQAg==');

@$core.Deprecated('Use accountStateDescriptor instead')
const AccountState$json = {
  '1': 'AccountState',
  '2': [
    {'1': 'organization', '3': 1, '4': 1, '5': 14, '6': '.endpoints.doorman.Organization', '10': 'organization'},
    {'1': 'has_access', '3': 2, '4': 1, '5': 8, '10': 'hasAccess'},
    {'1': 'active_fuks_member', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'activeFuksMember', '17': true},
  ],
  '8': [
    {'1': '_active_fuks_member'},
  ],
};

/// Descriptor for `AccountState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountStateDescriptor = $convert.base64Decode(
    'CgxBY2NvdW50U3RhdGUSQwoMb3JnYW5pemF0aW9uGAEgASgOMh8uZW5kcG9pbnRzLmRvb3JtYW'
    '4uT3JnYW5pemF0aW9uUgxvcmdhbml6YXRpb24SHQoKaGFzX2FjY2VzcxgCIAEoCFIJaGFzQWNj'
    'ZXNzEjEKEmFjdGl2ZV9mdWtzX21lbWJlchgDIAEoCEgAUhBhY3RpdmVGdWtzTWVtYmVyiAEBQh'
    'UKE19hY3RpdmVfZnVrc19tZW1iZXI=');

@$core.Deprecated('Use doorStateDescriptor instead')
const DoorState$json = {
  '1': 'DoorState',
  '2': [
    {'1': 'open', '3': 1, '4': 1, '5': 8, '10': 'open'},
    {'1': 'last_opened', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastOpened'},
    {'1': 'open_duration', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'openDuration'},
  ],
};

/// Descriptor for `DoorState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List doorStateDescriptor = $convert.base64Decode(
    'CglEb29yU3RhdGUSEgoEb3BlbhgBIAEoCFIEb3BlbhI7CgtsYXN0X29wZW5lZBgCIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCmxhc3RPcGVuZWQSPgoNb3Blbl9kdXJhdGlvbhgD'
    'IAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIMb3BlbkR1cmF0aW9u');

