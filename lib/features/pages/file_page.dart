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
    await ref.read(fileProvider).fetchingNewList(widget.noteFile.title.toString(), widget.noteFile.isUnderTheMain!);
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
          final result = await FileServices.addFilesToAllFiles("deneme", true, widget.noteFile.title.toString());
          if (result==true){
            final model = await FileServices.getFile("deneme", false);
            ref.read(fileProvider).addFile(widget.noteFile.title.toString(), model);
            widget.noteFile.list!.add("deneme");
            FileServices.updateFile(widget.noteFile.title.toString(), widget.noteFile.list!, widget.noteFile.isUnderTheMain!);
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
                itemCount: ref.watch(fileProvider).getSubFiles(widget.noteFile.title.toString()).length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  final NoteFilesModel model = ref.watch(fileProvider).getSubFiles(widget.noteFile.title.toString())[index];
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
