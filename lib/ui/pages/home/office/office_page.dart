import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman/doorman.pb.dart';
import 'package:fuks_app/services/challenge.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/pages/home/office/access.dart';
import 'package:fuks_app/ui/pages/home/office/no_access.dart';
import 'package:fuks_app/ui/pages/home/office/not_in_reach.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';

class OfficeBody extends StatefulWidget {
  const OfficeBody({super.key});

  @override
  State<StatefulWidget> createState() => _OfficeBodyState();
}

class _OfficeBodyState extends State<OfficeBody> {
  Future<AccessCheckResponse>? _request;
  String? _challenge;

  StreamSubscription<String>? _challengeSubscription;

  @override
  void initState() {
    super.initState();

    _challengeSubscription = ChallengeService.stream().listen((challenge) {
      final req = AccessCheckRequest();
      req.challenge = challenge;

      setState(() {
        _challenge = challenge;
        _request = doorman.checkAccess(req);
      });
    });
  }

  @override
  void dispose() {
    _challengeSubscription?.cancel();
    super.dispose();
  }

  Future<void> _refreshPermissions() async {
    if (_challenge == null) {
      return;
    }

    setState(() {
      _request = doorman.checkAccess(
        AccessCheckRequest()..challenge = _challenge!,
      );
    });

    await _request;
  }

  @override
  Widget build(BuildContext context) {
    if (_challenge == null) {
      return const NotInReach();
    }

    return FutureBuilder<AccessCheckResponse>(
      future: _request,
      builder: (context, snap) {
        Widget body;

        if (snap.hasError) {
          body = ErrorBody(
            error: snap.error,
            onRefresh: _refreshPermissions,
          );
        } else if (!snap.hasData) {
          body = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snap.requireData.hasAccess) {
          body = AccessBody(
            challenge: _challenge!,
          );
        } else {
          body = NoAccess(
            permission: snap.requireData,
            onRefresh: _refreshPermissions,
          );
        }

        return body;
      },
    );
  }
}
