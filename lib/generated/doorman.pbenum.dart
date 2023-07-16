//
//  Generated code. Do not modify.
//  source: doorman.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Organization extends $pb.ProtobufEnum {
  static const Organization UNKNOWN = Organization._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const Organization FUKS = Organization._(1, _omitEnumNames ? '' : 'FUKS');
  static const Organization VWI = Organization._(2, _omitEnumNames ? '' : 'VWI');

  static const $core.List<Organization> values = <Organization> [
    UNKNOWN,
    FUKS,
    VWI,
  ];

  static final $core.Map<$core.int, Organization> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Organization? valueOf($core.int value) => _byValue[value];

  const Organization._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
