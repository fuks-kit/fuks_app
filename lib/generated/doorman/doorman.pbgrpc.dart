//
//  Generated code. Do not modify.
//  source: doorman.proto
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

import 'doorman.pb.dart' as $0;

export 'doorman.pb.dart';

@$pb.GrpcServiceName('endpoints.doorman.v2.Doorman')
class DoormanClient extends $grpc.Client {
  static final _$checkPermissions = $grpc.ClientMethod<$0.Challenge, $0.OfficePermission>(
      '/endpoints.doorman.v2.Doorman/CheckPermissions',
      ($0.Challenge value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.OfficePermission.fromBuffer(value));
  static final _$openDoor = $grpc.ClientMethod<$0.Challenge, $0.DoorState>(
      '/endpoints.doorman.v2.Doorman/OpenDoor',
      ($0.Challenge value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DoorState.fromBuffer(value));

  DoormanClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.OfficePermission> checkPermissions($0.Challenge request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkPermissions, request, options: options);
  }

  $grpc.ResponseFuture<$0.DoorState> openDoor($0.Challenge request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$openDoor, request, options: options);
  }
}

@$pb.GrpcServiceName('endpoints.doorman.v2.Doorman')
abstract class DoormanServiceBase extends $grpc.Service {
  $core.String get $name => 'endpoints.doorman.v2.Doorman';

  DoormanServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Challenge, $0.OfficePermission>(
        'CheckPermissions',
        checkPermissions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Challenge.fromBuffer(value),
        ($0.OfficePermission value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Challenge, $0.DoorState>(
        'OpenDoor',
        openDoor_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Challenge.fromBuffer(value),
        ($0.DoorState value) => value.writeToBuffer()));
  }

  $async.Future<$0.OfficePermission> checkPermissions_Pre($grpc.ServiceCall call, $async.Future<$0.Challenge> request) async {
    return checkPermissions(call, await request);
  }

  $async.Future<$0.DoorState> openDoor_Pre($grpc.ServiceCall call, $async.Future<$0.Challenge> request) async {
    return openDoor(call, await request);
  }

  $async.Future<$0.OfficePermission> checkPermissions($grpc.ServiceCall call, $0.Challenge request);
  $async.Future<$0.DoorState> openDoor($grpc.ServiceCall call, $0.Challenge request);
}
