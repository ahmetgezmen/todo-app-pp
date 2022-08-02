import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../onboard/pages/onboard_home.dart';
import 'midway.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuth.instance.currentUser!=null ? const OnboardHome() :const MidWay(),
    );
  }
}
