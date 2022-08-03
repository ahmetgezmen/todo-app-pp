import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_pp/features/viewmodels/note_files_list_viewmodel.dart';

final fileProvider = ChangeNotifierProvider<NoteFilesListViewModel>((ref) {
  return NoteFilesListViewModel();
});
