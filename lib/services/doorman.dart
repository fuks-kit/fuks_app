import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fuks_app/generated/doorman/doorman.pbgrpc.dart';
import 'package:fuks_app/services/doorman_cert.dart';
import 'package:grpc/grpc.dart';

Uint8List _certificateBytes = utf8.encode(doormanCert);

// final _channel = ClientChannel(
//   'gateway.fuks.hsg.kit.edu',
//   port: 44888,
//   options: const ChannelOptions(
//     credentials: ChannelCredentials.insecure(),
//   ),
// );

final _channel = ClientChannel(
  'gateway.fuks.hsg.kit.edu',
  port: 44888,
  options: ChannelOptions(
    credentials: ChannelCredentials.secure(
      certificates: Uint8List.fromList(_certificateBytes),
    ),
  ),
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

  Future<AccessCheckResponse> checkAccess(AccessCheckRequest request) async {
    final token = await user?.getIdToken();
    return _client.checkAccess(request, options: _authOptions(token));
  }

  Future<DoorOpenResponse> openDoor(DoorOpenRequest request) async {
    final token = await user?.getIdToken();
    return _client.openDoor(request, options: _authOptions(token));
  }
}
