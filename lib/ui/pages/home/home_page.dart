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
            tooltip: 'Logout',
            onPressed: () {
              FirebaseAuth.instance.currentUser?.delete();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () => print('Open Settings'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  debugPrint('on check account');
                  doorman.checkAccount();
                  final info = await doorman.checkAccount();
                  debugPrint('hasAccess: ${info.hasAccess}');
                },
                child: const Text('Check Account'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
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
      ),
    );
  }
}
