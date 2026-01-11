
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/res/injection.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';
void main() async {

  await init();

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

await Supabase.initialize(
  url: "https://ivfayvbytwuewrsevbto.supabase.co",
  anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml2ZmF5dmJ5dHd1ZXdyc2V2YnRvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ1ODA1NDIsImV4cCI6MjA4MDE1NjU0Mn0.4rv-QVGUkOP_xUTQqUCdvOI3um1FyslY9qkTUG0B3A0",

);


  runApp(const MyApp());
}
