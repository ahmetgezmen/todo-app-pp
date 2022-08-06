import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        final toDayTime = Timestamp.now().toDate().toUtc();
        final timeStamp =
            toDayTime.year.toString()+'-'+
                toDayTime.month.toString()+'-'+
                toDayTime.day.toString()+'-'+
                toDayTime.hour.toString()+'-'+
                toDayTime.minute.toString()+'-'+
                toDayTime.second.toString()+'-'+
                toDayTime.microsecond.toString()
        ;
        await FileServices.addFiles('bbbbbb', false, timeStamp);
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
              notefile: noteFilesModelFromJson(
                      jsonEncode(providerFile.modelList[index].data()))
                  );
        },
      ),
    );
  }
}
