import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lnt_final_project/utils/flutterfire.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({ Key? key }) : super(key: key);

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {

  String? uid = FirebaseAuth.instance.currentUser.toString();
  String bimbelName = "";
  String bimbelId = "";
  String bimbelMail = "";

  @override
  Widget build(BuildContext context) {

    DocumentReference currentUser = FirebaseFirestore.instance
    .collection('bimbel')
    .doc(uid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(currentUser);
      if (!snapshot.exists) {
        print(uid);
      } else{
        bimbelName = snapshot['name'];
        bimbelId = snapshot['bimbelID'];
        bimbelMail = snapshot['email'];
      }
    });

    return Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Profile'),
            ),
            ListTile(
              title: Text(bimbelName),
            ),
            ListTile(
              title: Text(bimbelId),
            ),
            ListTile(
              title: Text(bimbelMail),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {LogoutUser(context);},
            ),
          ],
        ),
      );
  }
}