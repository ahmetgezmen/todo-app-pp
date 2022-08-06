import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_pp/constant/base_constant.dart';
import 'package:todo_app_pp/features/models/note_files_model.dart';
import 'package:todo_app_pp/features/providers/file_provider.dart';
import 'package:todo_app_pp/features/services/file_services.dart';
import 'package:todo_app_pp/features/widgets/app_barr_widget.dart';
import 'package:todo_app_pp/features/widgets/note_file_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  final double paddingNumber = 8.0;

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
            const AppBarWidget(),
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
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: SizedBox(
                height: 100,
                child: Row(
                    children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child:
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset("assets/svg/file-circle-plus-solid.svg"),
                          ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final toDayTime = Timestamp.now().toDate().toUtc();
                        final timeStamp = '${toDayTime.year}-${toDayTime.month}-${toDayTime.day}-${toDayTime.hour}-${toDayTime.minute}-${toDayTime.second}-${toDayTime.microsecond}';
                        await FileServices.addFiles('bbbbbb', false, timeStamp);
                        await ref.read(fileProvider).gettingFile();
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset("assets/svg/folder-plus-solid.svg"),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          },
        );
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
              notefile: noteFilesModelFromJson(
                  jsonEncode(providerFile.modelList[index].data())));
        },
      ),
    );
  }
}
