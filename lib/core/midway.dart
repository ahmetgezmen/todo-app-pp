import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_pp/features/pages/home_page.dart';
import 'package:todo_app_pp/features/providers/user_provider.dart';


class MidWay extends ConsumerStatefulWidget {
  const MidWay({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MidWayState();
}

class _MidWayState extends ConsumerState<MidWay> {

  bool _isInitialized = false;

  initializing() async {
    await ref.read(userProvider).gettingUser();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void initState() {
  initializing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized ? const MyHomePage(): const Center(child:  CircularProgressIndicator());
  }
}
