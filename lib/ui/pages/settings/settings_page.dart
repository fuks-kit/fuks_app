import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuks_app/ui/widgets/confirm_dialog.dart';
import 'package:fuks_app/ui/pages/settings/account_avatar.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/utils/authenticate.dart';
import 'package:fuks_app/utils/terms_and_privacy.dart';

const _version = '1.2.0';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const String route = 'settings';
  static final _auth = FirebaseAuth.instance;

  static void show(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }

  void _onSignOut(BuildContext context) => ConfirmDialog.show(
        context,
        title: 'Sign out',
        content: 'Are you sure you want to sign out?',
        onConfirm: () {
          if (_auth.currentUser?.isAnonymous ?? true) {
            _auth.currentUser?.delete();
          } else {
            _auth.signOut();
          }
        },
      );

  void _onDeleteAccount(BuildContext context) => ConfirmDialog.show(
        context,
        title: 'Delete account',
        content: 'Are you sure you want to delete your account?',
        onConfirm: () async {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            return;
          }

          if (user.isAnonymous) {
            user.delete();
            return;
          }

          if (user.providerData.isEmpty) {
            return;
          }

          for (var data in user.providerData) {
            final credentials = await Authenticate.credentialsForUserInfo(data);
            await user.reauthenticateWithCredential(credentials);

            user.delete();
            break;
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
    );
    final subtitleStyle = textTheme.bodySmall?.copyWith(
      color: color.outline,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ConstrainedListView(
        maxWidth: 600,
        padding: EdgeInsets.zero,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, top: 0, bottom: 8),
            child: Text(
              'Account',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 32,
            leading: const AccountAvatar(),
            title: Text(
              'User ID',
              style: titleStyle,
            ),
            subtitle: Text(
              _auth.currentUser?.uid ?? '',
              style: subtitleStyle,
            ),
            onTap: () async {
              // Copy to clipboard
              Clipboard.setData(
                ClipboardData(text: _auth.currentUser?.uid ?? ''),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User ID copied to clipboard'),
                ),
              );
            },
          ),
          if (!(_auth.currentUser?.isAnonymous ?? true))
            ListTile(
              minLeadingWidth: 32,
              leading: const Icon(Icons.logout),
              title: Text(
                'Sign out',
                style: titleStyle,
              ),
              subtitle: Text(
                'Sign out from your account',
                style: subtitleStyle,
              ),
              onTap: () => _onSignOut(context),
            ),
          ListTile(
            minLeadingWidth: 32,
            leading: const Icon(Icons.delete),
            title: Text(
              'Delete Account',
              style: titleStyle,
            ),
            subtitle: Text(
              'This action is irreversible',
              style: subtitleStyle,
            ),
            onTap: () => _onDeleteAccount(context),
          ),
          // const Divider(indent: 16, endIndent: 16, height: 60),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, top: 44, bottom: 8),
            child: Text(
              'About',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 32,
            leading: const Icon(Icons.policy),
            title: Text(
              'Terms and Conditions',
              style: titleStyle,
            ),
            subtitle: Text(
              'Read our terms of service',
              style: subtitleStyle,
            ),
            onTap: () => showTermsAndConditions(),
            // trailing: Icon(
            //   Icons.open_in_browser,
            //   // size: 12,
            //   color: color.outline,
            // ),
          ),
          ListTile(
            minLeadingWidth: 32,
            leading: const Icon(Icons.privacy_tip),
            title: Text(
              'Privacy Policy',
              style: titleStyle,
            ),
            subtitle: Text(
              'Read our privacy policy',
              style: subtitleStyle,
            ),
            onTap: () => showPrivacyPolicy(),
            // trailing: Icon(
            //   Icons.open_in_browser,
            //   // size: 12,
            //   color: color.outline,
            // ),
          ),
          ListTile(
            minLeadingWidth: 32,
            leading: const Icon(Icons.code),
            title: Text(
              'Licenses',
              style: titleStyle,
            ),
            subtitle: Text(
              'View open source licenses',
              style: subtitleStyle,
            ),
            onTap: () => showLicensePage(
              context: context,
              applicationVersion: _version,
              applicationLegalese: '© 2023 fuks e.V.',
              applicationIcon: SizedBox(
                width: 48,
                height: 48,
                child: SvgPicture.asset(
                  "assets/fuks_logo.svg",
                  colorFilter: ColorFilter.mode(
                    color.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 32,
            leading: const Icon(Icons.verified),
            title: Text(
              'Version',
              style: titleStyle,
            ),
            subtitle: Text(
              _version,
              style: subtitleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
