import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_pp/constant/onboard_contants.dart';
import 'package:todo_app_pp/core/midway.dart';
import 'package:todo_app_pp/features/services/google_services.dart';

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
            const Text(OnboardContant.loginOrSingUp),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 80,
                height: 80,
                child: InkWell(
                  onTap: () async {
                    await GoogleServices.signInWithGoogle();
                    if (FirebaseAuth.instance.currentUser == null) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            const AlertDialog(title: Text('Someting is Wrong')),
                      );
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MidWay(),
                      ));
                    }
                  },
                  child: SvgPicture.asset('assets/svg/icons8-google-480.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
