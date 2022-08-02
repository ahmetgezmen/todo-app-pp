import 'package:flutter/material.dart';

class OnboardHome extends StatefulWidget {
  const OnboardHome({Key? key}) : super(key: key);

  @override
  State<OnboardHome> createState() => _OnboardHomeState();
}

class _OnboardHomeState extends State<OnboardHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("onboard"),

          ],
        ),
      ),
    );
  }
}
