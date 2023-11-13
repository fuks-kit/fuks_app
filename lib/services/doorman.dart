import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fuks_app/generated/doorman/doorman.pbgrpc.dart';
import 'package:grpc/grpc.dart';

final _channel = ClientChannel(
  'raspberry.local',
  port: 50051,
  options: const ChannelOptions(
    credentials: ChannelCredentials.insecure(),
  ),
);

// final _channel = ClientChannel(
//   'doorman.local',
//   port: 50051,
//   options: ChannelOptions(
//     credentials: ChannelCredentials.secure(
//       certificates: doormanCert.codeUnits,
//       onBadCertificate: (certificate, host) {
//         // debugPrint('certificate: ${certificate.issuer}');
//         // debugPrint('host: $host');
//         return host == 'doorman.local:50051';
//       },
//     ),
//   ),
// );

final doorman = DoormanServiceWithToken();

class DoormanServiceWithToken {
  final _client = DoormanClient(_channel);

  User? get user => FirebaseAuth.instance.currentUser;

  CallOptions? _authOptions(String? token) {
    if (token == null) {
      return null;
    }

    return CallOptions(
      timeout: const Duration(seconds: 6),
      metadata: {
        "Authorization": "Bearer $token",
      },
    );
  }

  Future<OfficePermission> checkPermissions(Challenge request) async {
    final token = await user?.getIdToken();
    return _client.checkPermissions(request, options: _authOptions(token));
  }

  Future<DoorState> openDoor(Challenge request) async {
    final token = await user?.getIdToken();
    return _client.openDoor(request, options: _authOptions(token));
  }
}
