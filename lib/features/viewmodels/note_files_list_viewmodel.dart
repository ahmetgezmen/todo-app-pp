import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_pp/features/services/file_services.dart';

class NoteFilesListViewModel extends ChangeNotifier{
  List<QueryDocumentSnapshot<Map<String, dynamic>>>  _modelList = [];

  get lenght => _modelList.length;

  List<QueryDocumentSnapshot<Map<String, dynamic>>>  get modelList => _modelList;

  Future<void> gettingFile() async {
    _modelList = await FileServices.getFileLists();
    notifyListeners();
  }
  fetching(){

  }

}