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
  static final _$checkAccess = $grpc.ClientMethod<$0.AccessCheckRequest, $0.AccessCheckResponse>(
      '/endpoints.doorman.v2.Doorman/CheckAccess',
      ($0.AccessCheckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AccessCheckResponse.fromBuffer(value));
  static final _$openDoor = $grpc.ClientMethod<$0.DoorOpenRequest, $0.DoorOpenResponse>(
      '/endpoints.doorman.v2.Doorman/OpenDoor',
      ($0.DoorOpenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DoorOpenResponse.fromBuffer(value));

  DoormanClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AccessCheckResponse> checkAccess($0.AccessCheckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkAccess, request, options: options);
  }

  $grpc.ResponseFuture<$0.DoorOpenResponse> openDoor($0.DoorOpenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$openDoor, request, options: options);
  }
}

@$pb.GrpcServiceName('endpoints.doorman.v2.Doorman')
abstract class DoormanServiceBase extends $grpc.Service {
  $core.String get $name => 'endpoints.doorman.v2.Doorman';

  DoormanServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AccessCheckRequest, $0.AccessCheckResponse>(
        'CheckAccess',
        checkAccess_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AccessCheckRequest.fromBuffer(value),
        ($0.AccessCheckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DoorOpenRequest, $0.DoorOpenResponse>(
        'OpenDoor',
        openDoor_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DoorOpenRequest.fromBuffer(value),
        ($0.DoorOpenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AccessCheckResponse> checkAccess_Pre($grpc.ServiceCall call, $async.Future<$0.AccessCheckRequest> request) async {
    return checkAccess(call, await request);
  }

  $async.Future<$0.DoorOpenResponse> openDoor_Pre($grpc.ServiceCall call, $async.Future<$0.DoorOpenRequest> request) async {
    return openDoor(call, await request);
  }

  $async.Future<$0.AccessCheckResponse> checkAccess($grpc.ServiceCall call, $0.AccessCheckRequest request);
  $async.Future<$0.DoorOpenResponse> openDoor($grpc.ServiceCall call, $0.DoorOpenRequest request);
}
