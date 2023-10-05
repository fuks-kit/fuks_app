import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/pages/home/access.dart';
import 'package:fuks_app/ui/pages/home/connection_status.dart';
import 'package:fuks_app/ui/pages/home/no_access.dart';
import 'package:fuks_app/ui/pages/settings/settings_page.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/ui/widgets/fuks_logo.dart';
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

  Future<void> _refreshPermissions() async {
    setState(() {
      _request = doorman.checkPermissions();
    });

    await _request;
  }

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[
      IconButton(
        icon: const Icon(Icons.settings),
        tooltip: 'Settings',
        onPressed: () {
          SettingsPage.show(context);
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
          body = const AccessBody();
        } else {
          body = NoAccess(
            permission: snap.requireData,
            onRefresh: _refreshPermissions,
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const FuksLogo(),
            actions: actions,
          ),
          body: body,
        );
      },
    );
  }
}
