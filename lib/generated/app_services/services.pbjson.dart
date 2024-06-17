//
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use linkDescriptor instead')
const Link$json = {
  '1': 'Link',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Link`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkDescriptor = $convert.base64Decode(
    'CgRMaW5rEhQKBXRpdGxlGAEgASgJUgV0aXRsZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3'
    'JpcHRpb24SEAoDdXJsGAMgASgJUgN1cmw=');

@$core.Deprecated('Use linksDescriptor instead')
const Links$json = {
  '1': 'Links',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.endpoints.fcs.v1.Link', '10': 'items'},
  ],
};

/// Descriptor for `Links`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linksDescriptor = $convert.base64Decode(
    'CgVMaW5rcxIsCgVpdGVtcxgBIAMoCzIWLmVuZHBvaW50cy5mY3MudjEuTGlua1IFaXRlbXM=');

@$core.Deprecated('Use eventDescriptor instead')
const Event$json = {
  '1': 'Event',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'details', '3': 2, '4': 1, '5': 9, '10': 'details'},
    {'1': 'date', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'location', '3': 4, '4': 1, '5': 9, '10': 'location'},
    {'1': 'contact', '3': 5, '4': 1, '5': 11, '6': '.endpoints.fcs.v1.Contact', '10': 'contact'},
    {'1': 'label', '3': 6, '4': 1, '5': 9, '10': 'label'},
    {'1': 'buttonText', '3': 7, '4': 1, '5': 9, '10': 'buttonText'},
    {'1': 'buttonHref', '3': 8, '4': 1, '5': 9, '10': 'buttonHref'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode(
    'CgVFdmVudBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGAoHZGV0YWlscxgCIAEoCVIHZGV0YWlscx'
    'IuCgRkYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEZGF0ZRIaCghsb2Nh'
    'dGlvbhgEIAEoCVIIbG9jYXRpb24SMwoHY29udGFjdBgFIAEoCzIZLmVuZHBvaW50cy5mY3Mudj'
    'EuQ29udGFjdFIHY29udGFjdBIUCgVsYWJlbBgGIAEoCVIFbGFiZWwSHgoKYnV0dG9uVGV4dBgH'
    'IAEoCVIKYnV0dG9uVGV4dBIeCgpidXR0b25IcmVmGAggASgJUgpidXR0b25IcmVm');

@$core.Deprecated('Use eventsDescriptor instead')
const Events$json = {
  '1': 'Events',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.endpoints.fcs.v1.Event', '10': 'items'},
  ],
};

/// Descriptor for `Events`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventsDescriptor = $convert.base64Decode(
    'CgZFdmVudHMSLQoFaXRlbXMYASADKAsyFy5lbmRwb2ludHMuZmNzLnYxLkV2ZW50UgVpdGVtcw'
    '==');

@$core.Deprecated('Use contactDescriptor instead')
const Contact$json = {
  '1': 'Contact',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'eMail', '3': 2, '4': 1, '5': 9, '10': 'eMail'},
    {'1': 'imageUrl', '3': 3, '4': 1, '5': 9, '10': 'imageUrl'},
  ],
};

/// Descriptor for `Contact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactDescriptor = $convert.base64Decode(
    'CgdDb250YWN0EhIKBG5hbWUYASABKAlSBG5hbWUSFAoFZU1haWwYAiABKAlSBWVNYWlsEhoKCG'
    'ltYWdlVXJsGAMgASgJUghpbWFnZVVybA==');

@$core.Deprecated('Use projectDescriptor instead')
const Project$json = {
  '1': 'Project',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
    {'1': 'details', '3': 4, '4': 1, '5': 9, '10': 'details'},
    {'1': 'manager', '3': 5, '4': 1, '5': 11, '6': '.endpoints.fcs.v1.Contact', '10': 'manager'},
  ],
};

/// Descriptor for `Project`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectDescriptor = $convert.base64Decode(
    'CgdQcm9qZWN0EhQKBXRpdGxlGAEgASgJUgV0aXRsZRIaCghzdWJ0aXRsZRgCIAEoCVIIc3VidG'
    'l0bGUSFAoFbGFiZWwYAyABKAlSBWxhYmVsEhgKB2RldGFpbHMYBCABKAlSB2RldGFpbHMSMwoH'
    'bWFuYWdlchgFIAEoCzIZLmVuZHBvaW50cy5mY3MudjEuQ29udGFjdFIHbWFuYWdlcg==');

@$core.Deprecated('Use projectsDescriptor instead')
const Projects$json = {
  '1': 'Projects',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.endpoints.fcs.v1.Project', '10': 'items'},
  ],
};

/// Descriptor for `Projects`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectsDescriptor = $convert.base64Decode(
    'CghQcm9qZWN0cxIvCgVpdGVtcxgBIAMoCzIZLmVuZHBvaW50cy5mY3MudjEuUHJvamVjdFIFaX'
    'RlbXM=');

@$core.Deprecated('Use karlsruherTransferDescriptor instead')
const KarlsruherTransfer$json = {
  '1': 'KarlsruherTransfer',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    {'1': 'imageUrl', '3': 3, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'pdfUrl', '3': 4, '4': 1, '5': 9, '10': 'pdfUrl'},
  ],
};

/// Descriptor for `KarlsruherTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List karlsruherTransferDescriptor = $convert.base64Decode(
    'ChJLYXJsc3J1aGVyVHJhbnNmZXISFAoFdGl0bGUYASABKAlSBXRpdGxlEhoKCHN1YnRpdGxlGA'
    'IgASgJUghzdWJ0aXRsZRIaCghpbWFnZVVybBgDIAEoCVIIaW1hZ2VVcmwSFgoGcGRmVXJsGAQg'
    'ASgJUgZwZGZVcmw=');

@$core.Deprecated('Use karlsruherTransfersDescriptor instead')
const KarlsruherTransfers$json = {
  '1': 'KarlsruherTransfers',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.endpoints.fcs.v1.KarlsruherTransfer', '10': 'items'},
  ],
};

/// Descriptor for `KarlsruherTransfers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List karlsruherTransfersDescriptor = $convert.base64Decode(
    'ChNLYXJsc3J1aGVyVHJhbnNmZXJzEjoKBWl0ZW1zGAEgAygLMiQuZW5kcG9pbnRzLmZjcy52MS'
    '5LYXJsc3J1aGVyVHJhbnNmZXJSBWl0ZW1z');

