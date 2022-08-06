import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_pp/features/providers/file_provider.dart';
import 'package:todo_app_pp/features/services/file_services.dart';
import 'package:todo_app_pp/features/widgets/app_barr_widget.dart';

import '../../constant/base_constant.dart';
import '../models/note_files_model.dart';
import '../widgets/note_file_widget.dart';



class FilePage extends ConsumerStatefulWidget {
  final NoteFilesModel noteFile;
  final double paddingNumber = 8.0;
  const FilePage(this.noteFile, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _FilePageState();
}

class _FilePageState extends ConsumerState<FilePage> {
  bool _isFetchin = true;

  @override
  void didUpdateWidget(covariant FilePage oldWidget) {
    if(oldWidget.noteFile!=widget.noteFile){
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  fetching() async {
    await ref.read(fileProvider).fetchingNewList(widget.noteFile.uid.toString(), widget.noteFile.isUnderTheMain!);
    setState(() {
      _isFetchin = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetching();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
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
          final result = await FileServices.addFilesToAllFiles("deneme", true, widget.noteFile.uid.toString(),timeStamp);
          if (result[0]==true){
            final model = await FileServices.getFile(result[1], false);
            ref.read(fileProvider).addFile(widget.noteFile.uid.toString(), model);
            widget.noteFile.list!.add(timeStamp+widget.noteFile.title.toString());
            await Future.delayed(Duration(seconds: 1));
            FileServices.updateFile(widget.noteFile.uid.toString(), widget.noteFile.list!, widget.noteFile.isUnderTheMain!);
          }
        },
          child: const Icon(Icons.add),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
            _isFetchin
                ? Center(child: CircularProgressIndicator(),)
                :
            Expanded(
              child: GridView.builder(
                itemCount: ref.watch(fileProvider).getSubFiles(widget.noteFile.uid.toString()).length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  final NoteFilesModel model = ref.watch(fileProvider).getSubFiles(widget.noteFile.uid.toString())[index];
                  return NoteFileWidget(
                      notefile: model
                  );
                },
              ),
            ),
          ],),
      ),
    );
  }
}
