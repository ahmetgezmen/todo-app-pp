import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_pp/constant/base_constant.dart';
import 'package:todo_app_pp/features/models/note_files_model.dart';
import 'package:todo_app_pp/features/pages/profile_page.dart';
import 'package:todo_app_pp/features/providers/file_provider.dart';
import 'package:todo_app_pp/features/services/file_services.dart';
import 'package:todo_app_pp/features/widgets/note_file_widget.dart';

import '../widgets/circle_avatar_widget.dart';

class MyHomePage extends StatefulWidget {
  final double paddingNumber = 8.0;
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const FloatingActionsButtonWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
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
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widget.paddingNumber,
                  top: widget.paddingNumber,
                  bottom: widget.paddingNumber),
              child: Text(
                BaseConstant.myNotes,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            GridViewWidget(),
          ],
        ),
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

class FloatingActionsButtonWidget extends ConsumerStatefulWidget {
  const FloatingActionsButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FloatingActionsButtonWidgetState();
}

class _FloatingActionsButtonWidgetState
    extends ConsumerState<FloatingActionsButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await FileServices.addFiles('eeeee', false);
        await ref.read(fileProvider).gettingFile();
        setState(() {});
      },
      child: const Icon(Icons.add),
    );
  }
}

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerFile = ref.watch(fileProvider);
    return Expanded(
      child: GridView.builder(
        itemCount: providerFile.lenght,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return NoteFileWidget(
              title: noteFilesModelFromJson(
                      jsonEncode(providerFile.modelList[index].data()))
                  .title
                  .toString());
        },
      ),
    );
  }
}
