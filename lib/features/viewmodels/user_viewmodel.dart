import 'package:flutter/material.dart';
import 'package:todo_app_pp/features/models/user_model.dart';

class UserViewModel extends ChangeNotifier{
  late UserModel _user;

  get getUser => _user;

  gettingUser(){

    // todo getting user function

    notifyListeners();
  }


}