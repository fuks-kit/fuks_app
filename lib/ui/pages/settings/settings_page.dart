import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuks_app/ui/widgets/confirm_dialog.dart';
import 'package:fuks_app/ui/pages/settings/account_avatar.dart';
import 'package:fuks_app/utils/authenticate.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const AccountAvatar(),
            title: const Text('User ID'),
            subtitle: Text(_auth.currentUser?.uid ?? ''),
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
              leading: const CircleAvatar(
                child: Icon(Icons.logout),
              ),
              title: const Text('Sign out'),
              subtitle: const Text('Sign out from your account'),
              onTap: () => _onSignOut(context),
            ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.delete),
            ),
            title: const Text('Delete Account'),
            subtitle: const Text('This action is irreversible'),
            onTap: () => _onDeleteAccount(context),
          ),
        ],
      ),
    );
  }
}
