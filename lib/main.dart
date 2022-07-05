import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/failed.dart';
import 'package:sample_project/food_spot.dart';
import 'package:sample_project/forgot.dart';
import 'package:sample_project/order.dart';
import 'package:sample_project/payment.dart';
import 'package:sample_project/reset.dart';
import 'package:sample_project/start2.dart';
import 'package:sample_project/startpage.dart';
import 'home_screen.dart';
import 'login.dart';
import 'signup.dart';
import 'food_spot.dart';
import 'start2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startpage(),
    );
  }
}
