import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/generated/doorman.pb.dart';
import 'package:fuks_app/services/doorman.dart';
import 'package:fuks_app/ui/dialogs/error.dart';
import 'package:fuks_app/utils/error.dart';
import 'package:ms_undraw/ms_undraw.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<OfficePermission> _request;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _request = doorman.checkPermissions();

    debugPrint('user id: ${_auth.currentUser?.uid}');
  }

  void _refreshPermissions() {
    setState(() {
      _request = doorman.checkPermissions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: _auth.currentUser?.displayName != null
            ? Text('Hi, ${_auth.currentUser?.displayName}')
            : const Text(''),
        actions: [
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
        ],
      ),
      body: FutureBuilder<OfficePermission>(
        future: _request,
        builder: (context, snap) {
          if (snap.hasError) {
            if (ErrorUtils.isNotConnected(snap.error)) {
              return Container(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'No connection',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.merge(const TextStyle(
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: UnDraw(
                          illustration: UnDrawIllustration.signal_searching,
                          color: colorScheme.error,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text.rich(
                          const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Please connect to the ',
                              ),
                              TextSpan(
                                text: '"fuks" Wi-Fi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' to access the doorman system. '
                                    'Once connected, you can conveniently use the app for secure entry. ',
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            if (Platform.isAndroid || Platform.isIOS)
                              TextButton.icon(
                                onPressed: () {
                                  AppSettings.openAppSettings(
                                    type: AppSettingsType.wifi,
                                  );
                                },
                                icon: const Icon(Icons.wifi),
                                label: const Text('Check Wi-Fi'),
                                style: TextButton.styleFrom(
                                  foregroundColor: colorScheme.error,
                                ),
                              ),
                            FilledButton.icon(
                              onPressed: _refreshPermissions,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Retry'),
                              style: FilledButton.styleFrom(
                                foregroundColor: colorScheme.onError,
                                backgroundColor: colorScheme.error,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: Text(ErrorUtils.toText(snap.error)),
            );
          }

          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final permission = snap.requireData;

          if (permission.hasAccess) {
            return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Access granted',
                    style: textTheme.headlineSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: UnDraw(
                        illustration: UnDrawIllustration.agree,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FilledButton.icon(
                      onPressed: () {
                        doorman.openDoor().catchError((error, trace) =>
                            showErrorInfo(context, error, trace));
                      },
                      icon: const Icon(Icons.key),
                      label: const Text('Open door'),
                    ),
                  ),
                ],
              ),
            );
          }

          if (!permission.isFuksMember) {
            return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Not a fuks?',
                    style: textTheme.headlineSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: UnDraw(
                        illustration: UnDrawIllustration.questions,
                        color: colorScheme.tertiary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.info),
                            title: Text(
                              'If you are a fuks member please '
                              'sign-in with your @fuks.org account',
                              style: textTheme.bodySmall,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            leading: const Icon(Icons.favorite),
                            trailing: const Icon(Icons.navigate_next),
                            title: const Text('Become a fuks'),
                            onTap: () {},
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            leading: const Icon(Icons.help),
                            trailing: const Icon(Icons.navigate_next),
                            title: const Text('Get access as VWI'),
                            onTap: () {},
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     ListTile(
                        //       title: Text(
                        //         'VWI',
                        //         style: textTheme.headlineSmall,
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //     ListTile(
                        //       leading: const CircleAvatar(
                        //         radius: 14,
                        //         child: Text('1'),
                        //       ),
                        //       trailing: const Icon(Icons.copy),
                        //       title: const Text('Copy your User-ID'),
                        //       onTap: () {
                        //         final uid = auth.currentUser?.uid ?? "";
                        //         Clipboard.setData(ClipboardData(text: uid));
                        //
                        //         const snackBar = SnackBar(
                        //           content: Text('Copied User-ID to clipboard!'),
                        //         );
                        //
                        //         ScaffoldMessenger.of(context)
                        //             .showSnackBar(snackBar);
                        //       },
                        //     ),
                        //     ListTile(
                        //       leading: const CircleAvatar(
                        //         radius: 14,
                        //         child: Text('2'),
                        //       ),
                        //       title: Text('Contact your V1'),
                        //       trailing: const Icon(Icons.mail),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      'No access',
                      style: textTheme.headlineSmall?.merge(TextStyle(
                        color: colorScheme.error,
                      )),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: _refreshPermissions,
                    ),
                  ),
                  ListTile(
                    title: const Text('Has access'),
                    subtitle: Text('${permission.hasAccess}'),
                  ),
                  ListTile(
                    title: const Text('Is fuks Member'),
                    subtitle: Text('${permission.isFuksMember}'),
                  ),
                  ListTile(
                    title: const Text('Is active fuks'),
                    subtitle: Text('${permission.isActiveFuks}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
