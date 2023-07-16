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

import 'doorman.pbenum.dart';
import 'google/protobuf/duration.pb.dart' as $3;
import 'google/protobuf/timestamp.pb.dart' as $2;

export 'doorman.pbenum.dart';

class AccountState extends $pb.GeneratedMessage {
  factory AccountState() => create();
  AccountState._() : super();
  factory AccountState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountState', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman'), createEmptyInstance: create)
    ..e<Organization>(1, _omitFieldNames ? '' : 'organization', $pb.PbFieldType.OE, defaultOrMaker: Organization.UNKNOWN, valueOf: Organization.valueOf, enumValues: Organization.values)
    ..aOB(2, _omitFieldNames ? '' : 'hasAccess')
    ..aOB(3, _omitFieldNames ? '' : 'activeFuksMember')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountState clone() => AccountState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountState copyWith(void Function(AccountState) updates) => super.copyWith((message) => updates(message as AccountState)) as AccountState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountState create() => AccountState._();
  AccountState createEmptyInstance() => create();
  static $pb.PbList<AccountState> createRepeated() => $pb.PbList<AccountState>();
  @$core.pragma('dart2js:noInline')
  static AccountState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountState>(create);
  static AccountState? _defaultInstance;

  @$pb.TagNumber(1)
  Organization get organization => $_getN(0);
  @$pb.TagNumber(1)
  set organization(Organization v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrganization() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrganization() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get hasAccess => $_getBF(1);
  @$pb.TagNumber(2)
  set hasAccess($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHasAccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasAccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get activeFuksMember => $_getBF(2);
  @$pb.TagNumber(3)
  set activeFuksMember($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasActiveFuksMember() => $_has(2);
  @$pb.TagNumber(3)
  void clearActiveFuksMember() => clearField(3);
}

class DoorState extends $pb.GeneratedMessage {
  factory DoorState() => create();
  DoorState._() : super();
  factory DoorState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DoorState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DoorState', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.doorman'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'open')
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'lastOpened', subBuilder: $2.Timestamp.create)
    ..aOM<$3.Duration>(3, _omitFieldNames ? '' : 'openDuration', subBuilder: $3.Duration.create)
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
  $2.Timestamp get lastOpened => $_getN(1);
  @$pb.TagNumber(2)
  set lastOpened($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastOpened() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastOpened() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureLastOpened() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.Duration get openDuration => $_getN(2);
  @$pb.TagNumber(3)
  set openDuration($3.Duration v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOpenDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearOpenDuration() => clearField(3);
  @$pb.TagNumber(3)
  $3.Duration ensureOpenDuration() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
