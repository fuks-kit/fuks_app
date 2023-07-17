import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuks_app/services/doorman.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('fuks App'),
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
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () => print('Open Settings'),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: SelectableText(
              FirebaseAuth.instance.currentUser?.uid ?? "No user id",
            ),
            subtitle: const Text('User Id'),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilledButton(
              onPressed: () async {
                debugPrint('on check account');
                final startTime = DateTime.now();
                final info = await doorman.checkPermissions();
                debugPrint('request duration: ${DateTime.now().difference(startTime)}');
                debugPrint('hasAccess:    ${info.hasAccess}');
                debugPrint('isFuksMember: ${info.isFuksMember}');
                debugPrint('isActiveFuks: ${info.isActiveFuks}');
              },
              child: const Text('Check Account'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilledButton.tonal(
              onPressed: () async {
                debugPrint('on open door');
                final info = await doorman.openDoor();
                debugPrint('info ${info.openDuration}');
              },
              child: const Text('Open door'),
            ),
          ),
        ],
      ),
    );
  }
}
