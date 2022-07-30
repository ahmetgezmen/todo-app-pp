import 'package:flutter/material.dart';
import 'package:todo_app_pp/constant/base_constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(BaseConstant.appName),),
      body: Column(),
    );
  }
}
