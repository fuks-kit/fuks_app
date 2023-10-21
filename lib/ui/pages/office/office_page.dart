import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/pages/office/access.dart';
import 'package:fuks_app/ui/pages/office/connection_status.dart';
import 'package:fuks_app/ui/pages/office/no_access.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/utils/error.dart';

class OfficePage extends StatefulWidget {
  const OfficePage({super.key});

  static const String route = 'office';

  static void show(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  State<StatefulWidget> createState() => _OfficePageState();
}

class _OfficePageState extends State<OfficePage> {
  late Future<OfficePermission> _request;

  @override
  void initState() {
    super.initState();

    // Debug stuff to test the UI
    // final mockObj = OfficePermission();
    // mockObj.hasAccess = false;
    // mockObj.isFuksMember = true;
    // mockObj.isActiveFuks = false;
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
    return FutureBuilder<OfficePermission>(
      future: _request,
      builder: (context, snap) {
        Widget body;

        if (snap.hasError && ErrorUtils.isNotConnected(snap.error)) {
          body = ConnectionStatus(
            onRefreshPermissions: _refreshPermissions,
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
            title: const Text('Büro Zugang'),
          ),
          body: body,
        );
      },
    );
  }
}
