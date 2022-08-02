import 'package:flutter/material.dart';

import '../widgets/circleAvatar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CircleAvatar(
          child: CircleAvatarWidget(),
        )
      ]),
    );
  }
}
