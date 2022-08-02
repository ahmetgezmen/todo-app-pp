import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_pp/constant/profile_contants.dart';

import '../widgets/circleAvatar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  itemsSpaceHeight() {
    return const SizedBox(
      height: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              itemsSpaceHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(size: 30.0, Icons.arrow_back),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      onTap: () {
                        // todo routh setting page
                      },
                      child: Icon(Icons.settings),
                    ),
                  ),
                ],
              ),
              const CircleAvatarWidget(
                radiusCircleAvatar: 75.0,
              )
            ],
          ),
        ),
        bottomSheet: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text(ProfileContants.sign_out),
              ),
              ElevatedButton(
                onPressed: () {
                  // todo save function
                },
                child: const Text(
                  ProfileContants.save,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
