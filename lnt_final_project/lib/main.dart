import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lnt_final_project/pages/area_calc.dart';
import 'package:lnt_final_project/pages/counter.dart';
import 'package:lnt_final_project/pages/login.dart';
import 'package:lnt_final_project/pages/register.dart';
import 'package:lnt_final_project/pages/volume_calc.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Login(),
    );
  }
}