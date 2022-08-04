import 'package:flutter/material.dart';
import 'package:todo_app_pp/features/widgets/app_barr_widget.dart';

import '../../constant/base_constant.dart';
import '../models/note_files_model.dart';

class FilePage extends StatelessWidget {
  final NoteFilesModel noteFile;
  final double paddingNumber = 8.0;
  const FilePage({Key? key, required this.noteFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const FloatingABW(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const AppBarWidget(),
          Padding(
            padding: EdgeInsets.only(
                left: paddingNumber,
                top: paddingNumber,
                bottom: paddingNumber),
            child: Text(
              BaseConstant.myNotes,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],),
      ),
    );
  }
}

class FloatingABW extends StatelessWidget {
  const FloatingABW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      
    },);
  }
}
