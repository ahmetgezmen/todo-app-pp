import 'package:flutter/material.dart';
import 'package:todo_app_pp/features/pages/home_page.dart';

class MidWay extends StatefulWidget {
  const MidWay({Key? key}) : super(key: key);

  @override
  State<MidWay> createState() => _MidWayState();
}

class _MidWayState extends State<MidWay> {

  bool isInitialized = false;

  initializing(){

  }


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}
