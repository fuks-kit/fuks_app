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

import 'google/protobuf/duration.pb.dart' as $1;

class AccessCheckRequest extends $pb.GeneratedMessage {
  factory AccessCheckRequest() => create();
  AccessCheckRequest._() : super();
  factory AccessCheckRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccessCheckRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccessCheckRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman.v2'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'challenge')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccessCheckRequest clone() => AccessCheckRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccessCheckRequest copyWith(void Function(AccessCheckRequest) updates) => super.copyWith((message) => updates(message as AccessCheckRequest)) as AccessCheckRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessCheckRequest create() => AccessCheckRequest._();
  AccessCheckRequest createEmptyInstance() => create();
  static $pb.PbList<AccessCheckRequest> createRepeated() => $pb.PbList<AccessCheckRequest>();
  @$core.pragma('dart2js:noInline')
  static AccessCheckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccessCheckRequest>(create);
  static AccessCheckRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challenge => $_getSZ(0);
  @$pb.TagNumber(1)
  set challenge($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChallenge() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallenge() => clearField(1);
}

class DoorOpenRequest extends $pb.GeneratedMessage {
  factory DoorOpenRequest() => create();
  DoorOpenRequest._() : super();
  factory DoorOpenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoorOpenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DoorOpenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman.v2'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'challenge')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DoorOpenRequest clone() => DoorOpenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DoorOpenRequest copyWith(void Function(DoorOpenRequest) updates) => super.copyWith((message) => updates(message as DoorOpenRequest)) as DoorOpenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DoorOpenRequest create() => DoorOpenRequest._();
  DoorOpenRequest createEmptyInstance() => create();
  static $pb.PbList<DoorOpenRequest> createRepeated() => $pb.PbList<DoorOpenRequest>();
  @$core.pragma('dart2js:noInline')
  static DoorOpenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoorOpenRequest>(create);
  static DoorOpenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challenge => $_getSZ(0);
  @$pb.TagNumber(1)
  set challenge($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChallenge() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallenge() => clearField(1);
}

class AccessCheckResponse extends $pb.GeneratedMessage {
  factory AccessCheckResponse() => create();
  AccessCheckResponse._() : super();
  factory AccessCheckResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccessCheckResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccessCheckResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman.v2'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasAccess')
    ..aOB(2, _omitFieldNames ? '' : 'isFuks')
    ..aOB(3, _omitFieldNames ? '' : 'isActiveFuks')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccessCheckResponse clone() => AccessCheckResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccessCheckResponse copyWith(void Function(AccessCheckResponse) updates) => super.copyWith((message) => updates(message as AccessCheckResponse)) as AccessCheckResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessCheckResponse create() => AccessCheckResponse._();
  AccessCheckResponse createEmptyInstance() => create();
  static $pb.PbList<AccessCheckResponse> createRepeated() => $pb.PbList<AccessCheckResponse>();
  @$core.pragma('dart2js:noInline')
  static AccessCheckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccessCheckResponse>(create);
  static AccessCheckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasAccess => $_getBF(0);
  @$pb.TagNumber(1)
  set hasAccess($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasAccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isFuks => $_getBF(1);
  @$pb.TagNumber(2)
  set isFuks($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsFuks() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsFuks() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isActiveFuks => $_getBF(2);
  @$pb.TagNumber(3)
  set isActiveFuks($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsActiveFuks() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsActiveFuks() => clearField(3);
}

class DoorOpenResponse extends $pb.GeneratedMessage {
  factory DoorOpenResponse() => create();
  DoorOpenResponse._() : super();
  factory DoorOpenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoorOpenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DoorOpenResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman.v2'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'open')
    ..aOM<$1.Duration>(2, _omitFieldNames ? '' : 'openDuration', subBuilder: $1.Duration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DoorOpenResponse clone() => DoorOpenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DoorOpenResponse copyWith(void Function(DoorOpenResponse) updates) => super.copyWith((message) => updates(message as DoorOpenResponse)) as DoorOpenResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DoorOpenResponse create() => DoorOpenResponse._();
  DoorOpenResponse createEmptyInstance() => create();
  static $pb.PbList<DoorOpenResponse> createRepeated() => $pb.PbList<DoorOpenResponse>();
  @$core.pragma('dart2js:noInline')
  static DoorOpenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DoorOpenResponse>(create);
  static DoorOpenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get open => $_getBF(0);
  @$pb.TagNumber(1)
  set open($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpen() => clearField(1);

  @$pb.TagNumber(2)
  $1.Duration get openDuration => $_getN(1);
  @$pb.TagNumber(2)
  set openDuration($1.Duration v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOpenDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpenDuration() => clearField(2);
  @$pb.TagNumber(2)
  $1.Duration ensureOpenDuration() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
