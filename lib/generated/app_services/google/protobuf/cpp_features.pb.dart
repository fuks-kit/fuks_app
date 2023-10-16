//
//  Generated code. Do not modify.
//  source: google/protobuf/cpp_features.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CppFeatures extends $pb.GeneratedMessage {
  factory CppFeatures() => create();
  CppFeatures._() : super();
  factory CppFeatures.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CppFeatures.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CppFeatures', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'legacyClosedEnum')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CppFeatures clone() => CppFeatures()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CppFeatures copyWith(void Function(CppFeatures) updates) => super.copyWith((message) => updates(message as CppFeatures)) as CppFeatures;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CppFeatures create() => CppFeatures._();
  CppFeatures createEmptyInstance() => create();
  static $pb.PbList<CppFeatures> createRepeated() => $pb.PbList<CppFeatures>();
  @$core.pragma('dart2js:noInline')
  static CppFeatures getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CppFeatures>(create);
  static CppFeatures? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get legacyClosedEnum => $_getBF(0);
  @$pb.TagNumber(1)
  set legacyClosedEnum($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLegacyClosedEnum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegacyClosedEnum() => clearField(1);
}

class Cpp_features {
  static final cpp = $pb.Extension<CppFeatures>(_omitMessageNames ? '' : 'google.protobuf.FeatureSet', _omitFieldNames ? '' : 'cpp', 1000, $pb.PbFieldType.OM, defaultOrMaker: CppFeatures.getDefault, subBuilder: CppFeatures.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(cpp);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
