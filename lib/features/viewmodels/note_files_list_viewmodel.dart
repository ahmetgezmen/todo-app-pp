import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_pp/features/models/note_files_model.dart';
import 'package:todo_app_pp/features/services/file_services.dart';

class NoteFilesListViewModel extends ChangeNotifier{
  List<QueryDocumentSnapshot<Map<String, dynamic>>>  _modelList = [];
  Map<String, List<NoteFilesModel>> _noteFilesMap = {};

  Map<String, List<NoteFilesModel>> get noteFilesMap => _noteFilesMap;
  get lenght => _modelList.length;

  List<QueryDocumentSnapshot<Map<String, dynamic>>>  get modelList => _modelList;

  Future<void> gettingFile() async {
    _modelList = await FileServices.getFileLists();
    notifyListeners();
  }

  addFile(uid, NoteFilesModel notefile){
    _noteFilesMap[uid]!.add(notefile);
    notifyListeners();
  }

  List<NoteFilesModel> getSubFiles(String uid) => _noteFilesMap[uid]!;

  fetchingNewList(String uid, bool isUnderTheMain) async {
    NoteFilesModel noteFile = await FileServices.getFile(uid , isUnderTheMain);
    final List<NoteFilesModel> list = [];
    for (var element in noteFile.list!) {
      final newNote =  await FileServices.getFile(element, false);
      list.add(newNote);
    }
    _noteFilesMap[noteFile.uid.toString()] = list;
    notifyListeners();
  }

}