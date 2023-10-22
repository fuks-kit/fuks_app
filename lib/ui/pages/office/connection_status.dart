import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error.dart';
import 'package:undraw/undraw.dart';

class ConnectionStatus extends StatefulWidget {
  const ConnectionStatus({
    super.key,
    required this.onRefreshPermissions,
  });

  final AsyncCallback onRefreshPermissions;

  @override
  State createState() => _ConnectionStatusState();
}

class _ConnectionStatusState extends State<ConnectionStatus> {
  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return ConstrainedListView(
      shrinkWrap: true,
      primary: false,
      maxWidth: 400,
      children: [
        UnDraw(
          width: 192,
          height: 192,
          padding: const EdgeInsets.all(8),
          illustration: UnDrawIllustration.signal_searching,
          // illustration: UnDrawIllustration.warning,
          color: colorScheme.secondary,
        ),
        const SizedBox(height: 60),
        Text(
          'Keine Verbindung',
          textAlign: TextAlign.center,
          style: textStyle.headlineSmall?.merge(const TextStyle(
            fontWeight: FontWeight.w500,
          )),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            style: textStyle.bodyMedium?.merge(TextStyle(
              color: colorScheme.outline,
            )),
            children: const [
              TextSpan(
                text: 'Verbinde dich mit dem ',
              ),
              TextSpan(
                text: '"fuks" WLAN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' um Zugang zu erhalten',
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 60),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            if (Platform.isAndroid)
              OutlinedButton.icon(
                onPressed: () {
                  if (Platform.isAndroid) {
                    AppSettings.openAppSettings(
                      type: AppSettingsType.wifi,
                    );
                  }
                },
                icon: const Icon(Icons.wifi),
                label: const Text('WLAN Überprüfen'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.secondary,
                ),
              ),
            FilledButton.icon(
              onPressed: !_isRefreshing
                  ? () {
                      setState(() => _isRefreshing = true);
                      widget.onRefreshPermissions().then((_) {
                        setState(() => _isRefreshing = false);
                      }).catchError((error) {
                        setState(() => _isRefreshing = false);
                        showErrorInfo(context, error, StackTrace.current);
                      });
                    }
                  : () {},
              icon: _isRefreshing
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colorScheme.onSecondary,
                      ),
                    )
                  : const Icon(Icons.refresh),
              label: const Text('Wiederholen'),
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.onSecondary,
                backgroundColor: colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
