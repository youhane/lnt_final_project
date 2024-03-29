import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lnt_final_project/pages/login.dart';

void _showErrorMessage(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
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
    addBimbel(context, bimbelID, email, name, password);
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

Future<bool> LoginUser(BuildContext context, String email, String password) async{
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    return true;
  } catch (e) {
    _showErrorMessage(context, 'Incorrect Email or Password');
    return false;
  }
}

Future<void> LogoutUser(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
   Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const Login(),
    ),
  );
}

Future<bool> addBimbel(BuildContext context, String bimbelID, String email, String name, String password) async{
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentReference newDocument = FirebaseFirestore.instance.collection('bimbel').doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot newSnapshot = await transaction.get(newDocument);
      if(!newSnapshot.exists){
        newDocument.set({
          'bimbelID': bimbelID,
          'email': email,
          'name': name,
          'password': password,
        });
      }
    });
    return true;
  } catch (e) {
    _showErrorMessage(context, 'Error occured: $e');
    return false;
  }
}