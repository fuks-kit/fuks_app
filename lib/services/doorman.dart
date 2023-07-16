import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:fuks_app/generated/google/protobuf/empty.pb.dart';
import 'package:fuks_app/generated/doorman.pbgrpc.dart';

final _channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
  host: '192.168.0.125',
  port: 50051,
  transportSecure: false,
);

final doorman = DoormanServiceWithToken();

class DoormanServiceWithToken {
  final _client = DoormanClient(_channel);

  User? get user => FirebaseAuth.instance.currentUser;

  CallOptions? _authOptions(String? token) {
    if (token == null) {
      return null;
    }

    return CallOptions(
      metadata: {
        "Authorization": "Bearer $token",
      },
    );
  }

  Future<OfficePermission> checkPermissions() async {
    final token = await user?.getIdToken();
    return _client.checkPermissions(Empty(), options: _authOptions(token));
  }

  Future<DoorState> openDoor() async {
    final token = await user?.getIdToken();
    return _client.openDoor(Empty(), options: _authOptions(token));
  }
}
