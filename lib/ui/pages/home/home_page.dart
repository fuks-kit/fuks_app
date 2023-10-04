import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/pages/home/access_scaffold.dart';
import 'package:fuks_app/ui/pages/home/connection_status.dart';
import 'package:fuks_app/ui/pages/home/no_access_scaffold.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/utils/error.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = 'home';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<OfficePermission> _request;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    final mockObj = OfficePermission();
    mockObj.hasAccess = false;

    // _request = Future(() => mockObj);
    _request = doorman.checkPermissions();

    debugPrint('user id: ${_auth.currentUser?.uid}');
  }

  void _refreshPermissions() {
    debugPrint('_refreshPermissions');
    setState(() {
      _request = doorman.checkPermissions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[
      IconButton(
        icon: const Icon(Icons.logout),
        tooltip: 'Sign out',
        onPressed: () {
          if (FirebaseAuth.instance.currentUser?.isAnonymous ?? true) {
            FirebaseAuth.instance.currentUser?.delete();
          } else {
            FirebaseAuth.instance.signOut();
          }
        },
      ),
    ];

    return FutureBuilder<OfficePermission>(
      future: _request,
      builder: (context, snap) {
        debugPrint('snap.hasData: ${snap.hasData}');
        debugPrint('snap.hasError: ${snap.hasError}');

        if (snap.hasError && ErrorUtils.isNotConnected(snap.error)) {
          return ConnectionStatus(
            onRefreshPermissions: _refreshPermissions,
            actions: actions,
          );
        }

        if (snap.hasError) {
          return ErrorScaffold(
            error: snap.error,
            actions: actions,
          );
        }

        if (!snap.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final permission = snap.requireData;

        if (permission.hasAccess) {
          return AccessScaffold(
            actions: actions,
          );
        }

        return NoAccessScaffold(actions: actions);
      },
    );
  }
}
