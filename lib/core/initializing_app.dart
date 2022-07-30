import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'base_app.dart';

initializingApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
