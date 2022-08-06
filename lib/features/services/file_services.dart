import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_pp/features/models/note_files_model.dart';


final CollectionReference<Map<String, dynamic>> filesMain = FirebaseFirestore
    .instance
    .collection('files')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("main");
final CollectionReference<Map<String, dynamic>> filesAllFile = FirebaseFirestore
    .instance
    .collection('files')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection("allFiles");

class FileServices {
  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getFileLists() async {
    final QuerySnapshot<Map<String, dynamic>> quarySnapshot =
        await filesMain.orderBy("title").get();
    final docList = quarySnapshot.docs;
    return docList;
  }

  static Future<NoteFilesModel> getFile(String uid, bool isUnderTheMain) async {
    final docSnapshot = isUnderTheMain
        ? await filesMain.doc(uid).get()
        : await filesAllFile.doc(uid).get();
    NoteFilesModel model =
        noteFilesModelFromJson(jsonEncode(docSnapshot.data()));
    return model;
  }

  static updateFile(
      String uid, List<String> data, bool isUnderTheMain) async {
    final docRef =
        isUnderTheMain ? await filesMain.doc(uid) : await filesAllFile.doc(uid);
    docRef
        .update(
      {
        "list": data
      }
    )
        .then((value) => true)
        .catchError((error) => print("Failed to update File: $error"));
  }

  static Future addFiles(String title, bool isPrivate, String timeStamp) async {
    final QuerySnapshot<Map<String, dynamic>> quarySnapshot =
        await filesMain.get();
    for (int i = 0; i < quarySnapshot.docs.length; i++) {
      if (quarySnapshot.docs[i].data()['title'] == title) {
        print("not added");
        return false;
      }
    }

    return filesMain
        .doc(timeStamp+title)
        .set(jsonDecode(
          noteFilesModelToJson(
            NoteFilesModel(
              uid: timeStamp+title,
              isUnderTheMain: true,
              title: title,
              isPrivate: isPrivate,
              list: [],
            ),
          ),
        ))
        .then((value) => true)
        .catchError((error) => print("Failed to add File: $error"));
  }

  static Future addFilesToAllFiles(
      String title, bool isPrivate, String parentUid, String timeStamp) async {
    final QuerySnapshot<Map<String, dynamic>> quarySnapshot =
        await filesAllFile.get();
    for (int i = 0; i < quarySnapshot.docs.length; i++) {
      if (quarySnapshot.docs[i].data()['title'] == title && quarySnapshot.docs[i].data()['parentUid']==parentUid) {
        print("not added");
        return false;
      }
    }

    return filesAllFile
        .doc(timeStamp+title)
        .set(jsonDecode(
          noteFilesModelToJson(
            NoteFilesModel(
              uid: timeStamp+title,
              isUnderTheMain: false,
              title: title,
              isPrivate: isPrivate,
              list: [],
            ),
          ),
        ))
        .then((value) => [true, timeStamp+title])
        .catchError((error) => print("Failed to add File: $error"));
  }
}
