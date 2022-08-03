import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_pp/features/models/user_model.dart';

final CollectionReference users = FirebaseFirestore.instance.collection('users');

class UserServices {

  static Future<void> addUser() {
    final fireUser = FirebaseAuth.instance.currentUser!;
    return users
        .doc(fireUser.uid)
        .set(
          jsonDecode(
            userModelToJson(
              UserModel(
                  fname: fireUser.displayName,
                  email: fireUser.email,
                  uuid: fireUser.uid,
                  phone: fireUser.phoneNumber,
                  picsUrl: fireUser.photoURL,
                  isApproved: fireUser.emailVerified),
            ),
          ),
        SetOptions(
          merge: true,
        ))
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static getMyInfo() async {
    DocumentSnapshot<Object?> docSnapshot = await users.doc(FirebaseAuth.instance.currentUser!.uid.toString()).get();
    if ( docSnapshot.data()==null ){
      return false;
    }
    return UserModel.fromJson(docSnapshot.data());
  }

}
