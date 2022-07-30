import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoteFileWidget extends StatefulWidget {
  final String title;
  const NoteFileWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<NoteFileWidget> createState() => _NoteFileWidgetState();
}

class _NoteFileWidgetState extends State<NoteFileWidget> {

  @override
  void didUpdateWidget(covariant NoteFileWidget oldWidget) {
    if(oldWidget.title!=widget.title){
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: SvgPicture.asset("assets/svg/files-icon.svg")),
        Text(widget.title, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

