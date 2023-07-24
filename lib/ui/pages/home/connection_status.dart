import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:undraw/undraw.dart';

class ConnectionStatus extends StatelessWidget {
  const ConnectionStatus({
    super.key,
    required this.onRefreshPermissions,
    this.actions,
  });

  final VoidCallback onRefreshPermissions;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'No connection',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions,
      ),
      body: Container(
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
                      onPressed: onRefreshPermissions,
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
      ),
    );
  }
}
