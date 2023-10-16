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

import 'google/protobuf/duration.pb.dart' as $2;

class OfficePermission extends $pb.GeneratedMessage {
  factory OfficePermission() => create();
  OfficePermission._() : super();
  factory OfficePermission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OfficePermission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OfficePermission', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasAccess')
    ..aOB(2, _omitFieldNames ? '' : 'isFuksMember')
    ..aOB(3, _omitFieldNames ? '' : 'isActiveFuks')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OfficePermission clone() => OfficePermission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OfficePermission copyWith(void Function(OfficePermission) updates) => super.copyWith((message) => updates(message as OfficePermission)) as OfficePermission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OfficePermission create() => OfficePermission._();
  OfficePermission createEmptyInstance() => create();
  static $pb.PbList<OfficePermission> createRepeated() => $pb.PbList<OfficePermission>();
  @$core.pragma('dart2js:noInline')
  static OfficePermission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OfficePermission>(create);
  static OfficePermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasAccess => $_getBF(0);
  @$pb.TagNumber(1)
  set hasAccess($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasAccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isFuksMember => $_getBF(1);
  @$pb.TagNumber(2)
  set isFuksMember($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsFuksMember() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsFuksMember() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isActiveFuks => $_getBF(2);
  @$pb.TagNumber(3)
  set isActiveFuks($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsActiveFuks() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsActiveFuks() => clearField(3);
}

class DoorState extends $pb.GeneratedMessage {
  factory DoorState() => create();
  DoorState._() : super();
  factory DoorState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoorState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DoorState', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'open')
    ..aOM<$2.Duration>(2, _omitFieldNames ? '' : 'openDuration', subBuilder: $2.Duration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DoorState clone() => DoorState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DoorState copyWith(void Function(DoorState) updates) => super.copyWith((message) => updates(message as DoorState)) as DoorState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DoorState create() => DoorState._();
  DoorState createEmptyInstance() => create();
  static $pb.PbList<DoorState> createRepeated() => $pb.PbList<DoorState>();
  @$core.pragma('dart2js:noInline')
  static DoorState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoorState>(create);
  static DoorState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get open => $_getBF(0);
  @$pb.TagNumber(1)
  set open($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpen() => clearField(1);

  @$pb.TagNumber(2)
  $2.Duration get openDuration => $_getN(1);
  @$pb.TagNumber(2)
  set openDuration($2.Duration v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOpenDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpenDuration() => clearField(2);
  @$pb.TagNumber(2)
  $2.Duration ensureOpenDuration() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
