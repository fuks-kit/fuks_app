import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuks_app/generated/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/pages/home/access.dart';
import 'package:fuks_app/ui/pages/home/connection_status.dart';
import 'package:fuks_app/ui/pages/home/no_access.dart';
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

  @override
  void initState() {
    super.initState();

    // Debug stuff to test the UI
    // final mockObj = OfficePermission();
    // mockObj.hasAccess = false;
    // mockObj.isFuksMember = true;
    // mockObj.isActiveFuks = false;
    //
    // _request = Future(() => mockObj);
    // _request = Future.error(const GrpcError.unavailable());

    _request = doorman.checkPermissions();
  }

  Future<void> _refreshPermissions() {
    setState(() {
      _request = doorman.checkPermissions();
    });

    return _request;
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
        Widget body;

        if (snap.hasError && ErrorUtils.isNotConnected(snap.error)) {
          body = ConnectionStatus(
            onRefreshPermissions: _refreshPermissions,
            actions: actions,
          );
        } else if (snap.hasError) {
          body = ErrorBody(
            error: snap.error,
          );
        } else if (!snap.hasData) {
          body = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snap.requireData.hasAccess) {
          body = AccessBody(
            permission: snap.requireData,
          );
        } else {
          body = NoAccess(
            permission: snap.requireData,
            onRefresh: _refreshPermissions,
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    "assets/fuks_logo.svg",
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'fuks',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // if (permission.isFuksMember)
              ],
            ),
            actions: actions,
          ),
          body: body,
        );
      },
    );
  }
}
