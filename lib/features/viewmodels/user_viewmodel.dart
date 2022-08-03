import 'package:flutter/material.dart';
import 'package:todo_app_pp/features/models/user_model.dart';
import 'package:todo_app_pp/features/services/users_services.dart';

class UserViewModel extends ChangeNotifier{
  late UserModel _user;

  get getUser => _user;

  gettingUser() async {
    _user = await UserServices.getMyInfo();
    notifyListeners();
  }


}