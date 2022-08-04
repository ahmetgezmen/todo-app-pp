import 'package:flutter/material.dart';

import '../../constant/base_constant.dart';
import '../pages/profile_page.dart';
import 'circle_avatar_widget.dart';

class AppBarWidget extends StatefulWidget {
  final double paddingNumber = 8.0;
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarLeadingButton(
            paddingNumber: widget.paddingNumber,
          ),
          Text(
            BaseConstant.appName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
              onPressed: () {
                // todo bildirimler
              },
              icon: const Icon(Icons.add_alert))
        ],
      ),
    );
  }
}

class AppBarLeadingButton extends StatelessWidget {
  final double paddingNumber;
  const AppBarLeadingButton({Key? key, required this.paddingNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingNumber),
      child: InkWell(
        onTap: () async {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage(),));
          await Scaffold.of(context)
              .showBottomSheet(
                (buildContext) => const ProfilePage(),
          )
              .closed;
        },
        child: const CircleAvatarWidget(),
      ),
    );
  }
}