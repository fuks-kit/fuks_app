//
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

class Link extends $pb.GeneratedMessage {
  factory Link({
    $core.String? title,
    $core.String? description,
    $core.String? url,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (description != null) {
      $result.description = description;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  Link._() : super();
  factory Link.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Link.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Link', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Link clone() => Link()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Link copyWith(void Function(Link) updates) => super.copyWith((message) => updates(message as Link)) as Link;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Link create() => Link._();
  Link createEmptyInstance() => create();
  static $pb.PbList<Link> createRepeated() => $pb.PbList<Link>();
  @$core.pragma('dart2js:noInline')
  static Link getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Link>(create);
  static Link? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);
}

class Links extends $pb.GeneratedMessage {
  factory Links({
    $core.Iterable<Link>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  Links._() : super();
  factory Links.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Links.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Links', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..pc<Link>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: Link.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Links clone() => Links()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Links copyWith(void Function(Links) updates) => super.copyWith((message) => updates(message as Links)) as Links;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Links create() => Links._();
  Links createEmptyInstance() => create();
  static $pb.PbList<Links> createRepeated() => $pb.PbList<Links>();
  @$core.pragma('dart2js:noInline')
  static Links getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Links>(create);
  static Links? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Link> get items => $_getList(0);
}

class Event extends $pb.GeneratedMessage {
  factory Event({
    $core.String? title,
    $core.String? details,
    $2.Timestamp? date,
    $core.String? location,
    Contact? contact,
    $core.String? label,
    $core.String? buttonText,
    $core.String? buttonHref,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (details != null) {
      $result.details = details;
    }
    if (date != null) {
      $result.date = date;
    }
    if (location != null) {
      $result.location = location;
    }
    if (contact != null) {
      $result.contact = contact;
    }
    if (label != null) {
      $result.label = label;
    }
    if (buttonText != null) {
      $result.buttonText = buttonText;
    }
    if (buttonHref != null) {
      $result.buttonHref = buttonHref;
    }
    return $result;
  }
  Event._() : super();
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Event', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'details')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'date', subBuilder: $2.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'location')
    ..aOM<Contact>(5, _omitFieldNames ? '' : 'contact', subBuilder: Contact.create)
    ..aOS(6, _omitFieldNames ? '' : 'label')
    ..aOS(7, _omitFieldNames ? '' : 'buttonText', protoName: 'buttonText')
    ..aOS(8, _omitFieldNames ? '' : 'buttonHref', protoName: 'buttonHref')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event)) as Event;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get details => $_getSZ(1);
  @$pb.TagNumber(2)
  set details($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetails() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get date => $_getN(2);
  @$pb.TagNumber(3)
  set date($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get location => $_getSZ(3);
  @$pb.TagNumber(4)
  set location($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => clearField(4);

  @$pb.TagNumber(5)
  Contact get contact => $_getN(4);
  @$pb.TagNumber(5)
  set contact(Contact v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasContact() => $_has(4);
  @$pb.TagNumber(5)
  void clearContact() => clearField(5);
  @$pb.TagNumber(5)
  Contact ensureContact() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get label => $_getSZ(5);
  @$pb.TagNumber(6)
  set label($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLabel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLabel() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get buttonText => $_getSZ(6);
  @$pb.TagNumber(7)
  set buttonText($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasButtonText() => $_has(6);
  @$pb.TagNumber(7)
  void clearButtonText() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get buttonHref => $_getSZ(7);
  @$pb.TagNumber(8)
  set buttonHref($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasButtonHref() => $_has(7);
  @$pb.TagNumber(8)
  void clearButtonHref() => clearField(8);
}

class Events extends $pb.GeneratedMessage {
  factory Events({
    $core.Iterable<Event>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  Events._() : super();
  factory Events.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Events.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Events', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..pc<Event>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Events clone() => Events()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Events copyWith(void Function(Events) updates) => super.copyWith((message) => updates(message as Events)) as Events;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Events create() => Events._();
  Events createEmptyInstance() => create();
  static $pb.PbList<Events> createRepeated() => $pb.PbList<Events>();
  @$core.pragma('dart2js:noInline')
  static Events getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Events>(create);
  static Events? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Event> get items => $_getList(0);
}

class Contact extends $pb.GeneratedMessage {
  factory Contact({
    $core.String? name,
    $core.String? eMail,
    $core.String? imageUrl,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (eMail != null) {
      $result.eMail = eMail;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    return $result;
  }
  Contact._() : super();
  factory Contact.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Contact.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Contact', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'eMail', protoName: 'eMail')
    ..aOS(3, _omitFieldNames ? '' : 'imageUrl', protoName: 'imageUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Contact clone() => Contact()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Contact copyWith(void Function(Contact) updates) => super.copyWith((message) => updates(message as Contact)) as Contact;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Contact create() => Contact._();
  Contact createEmptyInstance() => create();
  static $pb.PbList<Contact> createRepeated() => $pb.PbList<Contact>();
  @$core.pragma('dart2js:noInline')
  static Contact getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Contact>(create);
  static Contact? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get eMail => $_getSZ(1);
  @$pb.TagNumber(2)
  set eMail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEMail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEMail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => clearField(3);
}

class Project extends $pb.GeneratedMessage {
  factory Project({
    $core.String? title,
    $core.String? subtitle,
    $core.String? label,
    $core.String? details,
    Contact? manager,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (subtitle != null) {
      $result.subtitle = subtitle;
    }
    if (label != null) {
      $result.label = label;
    }
    if (details != null) {
      $result.details = details;
    }
    if (manager != null) {
      $result.manager = manager;
    }
    return $result;
  }
  Project._() : super();
  factory Project.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Project.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Project', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'subtitle')
    ..aOS(3, _omitFieldNames ? '' : 'label')
    ..aOS(4, _omitFieldNames ? '' : 'details')
    ..aOM<Contact>(5, _omitFieldNames ? '' : 'manager', subBuilder: Contact.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Project copyWith(void Function(Project) updates) => super.copyWith((message) => updates(message as Project)) as Project;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get details => $_getSZ(3);
  @$pb.TagNumber(4)
  set details($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDetails() => $_has(3);
  @$pb.TagNumber(4)
  void clearDetails() => clearField(4);

  @$pb.TagNumber(5)
  Contact get manager => $_getN(4);
  @$pb.TagNumber(5)
  set manager(Contact v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasManager() => $_has(4);
  @$pb.TagNumber(5)
  void clearManager() => clearField(5);
  @$pb.TagNumber(5)
  Contact ensureManager() => $_ensure(4);
}

class Projects extends $pb.GeneratedMessage {
  factory Projects({
    $core.Iterable<Project>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  Projects._() : super();
  factory Projects.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Projects.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Projects', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..pc<Project>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: Project.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Projects clone() => Projects()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Projects copyWith(void Function(Projects) updates) => super.copyWith((message) => updates(message as Projects)) as Projects;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Projects create() => Projects._();
  Projects createEmptyInstance() => create();
  static $pb.PbList<Projects> createRepeated() => $pb.PbList<Projects>();
  @$core.pragma('dart2js:noInline')
  static Projects getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Projects>(create);
  static Projects? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Project> get items => $_getList(0);
}

class KarlsruherTransfer extends $pb.GeneratedMessage {
  factory KarlsruherTransfer({
    $core.String? title,
    $core.String? subtitle,
    $core.String? imageUrl,
    $core.String? pdfUrl,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (subtitle != null) {
      $result.subtitle = subtitle;
    }
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (pdfUrl != null) {
      $result.pdfUrl = pdfUrl;
    }
    return $result;
  }
  KarlsruherTransfer._() : super();
  factory KarlsruherTransfer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KarlsruherTransfer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KarlsruherTransfer', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'subtitle')
    ..aOS(3, _omitFieldNames ? '' : 'imageUrl', protoName: 'imageUrl')
    ..aOS(4, _omitFieldNames ? '' : 'pdfUrl', protoName: 'pdfUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KarlsruherTransfer clone() => KarlsruherTransfer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KarlsruherTransfer copyWith(void Function(KarlsruherTransfer) updates) => super.copyWith((message) => updates(message as KarlsruherTransfer)) as KarlsruherTransfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KarlsruherTransfer create() => KarlsruherTransfer._();
  KarlsruherTransfer createEmptyInstance() => create();
  static $pb.PbList<KarlsruherTransfer> createRepeated() => $pb.PbList<KarlsruherTransfer>();
  @$core.pragma('dart2js:noInline')
  static KarlsruherTransfer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KarlsruherTransfer>(create);
  static KarlsruherTransfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get pdfUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set pdfUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPdfUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearPdfUrl() => clearField(4);
}

class KarlsruherTransfers extends $pb.GeneratedMessage {
  factory KarlsruherTransfers({
    $core.Iterable<KarlsruherTransfer>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  KarlsruherTransfers._() : super();
  factory KarlsruherTransfers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KarlsruherTransfers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KarlsruherTransfers', package: const $pb.PackageName(_omitMessageNames ? '' : 'endpoints.fcs.v1'), createEmptyInstance: create)
    ..pc<KarlsruherTransfer>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: KarlsruherTransfer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KarlsruherTransfers clone() => KarlsruherTransfers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KarlsruherTransfers copyWith(void Function(KarlsruherTransfers) updates) => super.copyWith((message) => updates(message as KarlsruherTransfers)) as KarlsruherTransfers;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KarlsruherTransfers create() => KarlsruherTransfers._();
  KarlsruherTransfers createEmptyInstance() => create();
  static $pb.PbList<KarlsruherTransfers> createRepeated() => $pb.PbList<KarlsruherTransfers>();
  @$core.pragma('dart2js:noInline')
  static KarlsruherTransfers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KarlsruherTransfers>(create);
  static KarlsruherTransfers? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KarlsruherTransfer> get items => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
