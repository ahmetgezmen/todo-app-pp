import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatefulWidget {
  final double? radiusCircleAvatar;
  const CircleAvatarWidget({Key? key, this.radiusCircleAvatar}) : super(key: key);

  @override
  State<CircleAvatarWidget> createState() => _CircleAvatarWidgetState();
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radiusCircleAvatar ?? 20.0,
      child: Text(FirebaseAuth.instance.currentUser!.displayName
              .toString()
              .split(' ')
              .first
              .substring(0, 1) +
          FirebaseAuth.instance.currentUser!.displayName
              .toString()
              .split(' ')
              .last
              .substring(0, 1)),
    );
  }
}
