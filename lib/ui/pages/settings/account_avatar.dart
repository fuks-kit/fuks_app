import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({super.key});

  static final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final photo = _auth.currentUser?.photoURL ?? "";

    if (photo.isEmpty) {
      return const CircleAvatar(
        child: Icon(Icons.person),
      );
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(photo),
      );
    }
  }
}
