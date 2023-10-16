//
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $0;
import 'services.pb.dart' as $1;

export 'services.pb.dart';

@$pb.GrpcServiceName('endpoints.fcs.v1.AppServices')
class AppServicesClient extends $grpc.Client {
  static final _$getEvents = $grpc.ClientMethod<$0.Empty, $1.Events>(
      '/endpoints.fcs.v1.AppServices/GetEvents',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Events.fromBuffer(value));
  static final _$getProjects = $grpc.ClientMethod<$0.Empty, $1.Projects>(
      '/endpoints.fcs.v1.AppServices/GetProjects',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Projects.fromBuffer(value));
  static final _$getKarlsruherTransfers = $grpc.ClientMethod<$0.Empty, $1.KarlsruherTransfers>(
      '/endpoints.fcs.v1.AppServices/GetKarlsruherTransfers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.KarlsruherTransfers.fromBuffer(value));

  AppServicesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Events> getEvents($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEvents, request, options: options);
  }

  $grpc.ResponseFuture<$1.Projects> getProjects($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProjects, request, options: options);
  }

  $grpc.ResponseFuture<$1.KarlsruherTransfers> getKarlsruherTransfers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getKarlsruherTransfers, request, options: options);
  }
}

@$pb.GrpcServiceName('endpoints.fcs.v1.AppServices')
abstract class AppServicesServiceBase extends $grpc.Service {
  $core.String get $name => 'endpoints.fcs.v1.AppServices';

  AppServicesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Events>(
        'GetEvents',
        getEvents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Events value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Projects>(
        'GetProjects',
        getProjects_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Projects value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.KarlsruherTransfers>(
        'GetKarlsruherTransfers',
        getKarlsruherTransfers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.KarlsruherTransfers value) => value.writeToBuffer()));
  }

  $async.Future<$1.Events> getEvents_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getEvents(call, await request);
  }

  $async.Future<$1.Projects> getProjects_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getProjects(call, await request);
  }

  $async.Future<$1.KarlsruherTransfers> getKarlsruherTransfers_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getKarlsruherTransfers(call, await request);
  }

  $async.Future<$1.Events> getEvents($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Projects> getProjects($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.KarlsruherTransfers> getKarlsruherTransfers($grpc.ServiceCall call, $0.Empty request);
}
