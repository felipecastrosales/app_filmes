import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:app_filmes/application/movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseRemoteConfig.instance.fetchAndActivate();
  runApp(
    // ignore: prefer_const_constructors
    MovieApp(), // it's not 'const' because void main is async
  );
}
