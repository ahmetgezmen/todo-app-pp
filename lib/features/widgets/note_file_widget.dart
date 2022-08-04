import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_pp/features/models/note_files_model.dart';

import '../pages/file_page.dart';

class NoteFileWidget extends StatefulWidget {
  final NoteFilesModel notefile;
  const NoteFileWidget({Key? key, required this.notefile}) : super(key: key);

  @override
  State<NoteFileWidget> createState() => _NoteFileWidgetState();
}

class _NoteFileWidgetState extends State<NoteFileWidget> {
  @override
  void didUpdateWidget(covariant NoteFileWidget oldWidget) {
    if (oldWidget.notefile != widget.notefile) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilePage( widget.notefile),),);
          },
          child: SvgPicture.asset(
            "assets/svg/files-icon.svg",
            height: 100,
          ),
        ),
        Text(widget.notefile.title.toString(), style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
