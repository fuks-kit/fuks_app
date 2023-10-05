import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({super.key});

  static final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final photo = _auth.currentUser?.photoURL ?? "";

    if (photo.isEmpty) {
      return const Icon(Icons.fingerprint);
    } else {
      return CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(photo),
      );
    }
  }
}
