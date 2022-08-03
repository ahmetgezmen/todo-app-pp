import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_pp/features/models/note_files_model.dart';

final CollectionReference<Map<String, dynamic>> files = FirebaseFirestore
    .instance
    .collection('files')
    .doc('userFiles')
    .collection(FirebaseAuth.instance.currentUser!.uid);

class FileServices {

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getFileLists() async {
    final QuerySnapshot<Map<String, dynamic>> quarySnapshot = await files.orderBy("title").get();
    final docList = quarySnapshot.docs;
    return docList;
  }


  static Future addFiles(String title, bool isPrivate) async {
    final QuerySnapshot<Map<String, dynamic>> quarySnapshot = await files.get();
    for (int i = 0; i < quarySnapshot.docs.length; i++) {
      if (quarySnapshot.docs[i].data()['title'] == title) {
        print("not added");
        return false;
      }
    }

    return files
        .doc(title)
        .set(jsonDecode(
          noteFilesModelToJson(
            NoteFilesModel(
              title: title,
              isPrivate: isPrivate,
              list: [],
            ),
          ),
        ))
        .then((value) => print("File Added"))
        .catchError((error) => print("Failed to add File: $error"));
  }
}
