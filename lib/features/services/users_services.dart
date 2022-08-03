import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_pp/features/models/user_model.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class UserServices {

  static Future<void> addUser() {
    final fireUser = FirebaseAuth.instance.currentUser!;
    return users
        .doc(fireUser.uid)
        .set(
          jsonDecode(
            userModelToJson(
              UserModel(
                  fname: fireUser.displayName.toString(),
                  email: fireUser.email.toString(),
                  uuid: fireUser.uid.toString(),
                  phone: fireUser.phoneNumber.toString(),
                  picsUrl: fireUser.photoURL.toString(),
                  isApproved: fireUser.emailVerified),
            ),
          ),
        SetOptions(
          merge: true,
        ))
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
