import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void _showErrorMessage(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(context.toString()),
      action: SnackBarAction(
        label: 'OK',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ),
  );
}

Future<bool> RegisterAccount(BuildContext context, String bimbelID, String email, String name, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      _showErrorMessage(context, 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      _showErrorMessage(context, 'The account already exists for that email.');
    } else if (e.code == 'invalid-email') {
      _showErrorMessage(context, 'The email address is malformed.');
    } else {
      _showErrorMessage(context, 'Error occured: $e');
    }
    return false;
  } catch (e) {
    _showErrorMessage(context, 'Error occured: $e');
    return false;
  }
}