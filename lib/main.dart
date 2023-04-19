import 'package:flutter/material.dart';
import 'package:interior_app/ui/Home_Page/GioHang_UI.dart';
import 'package:interior_app/ui/Home_UI.dart';
import 'package:interior_app/ui/Login_UI.dart';
import 'package:interior_app/ui/Signup_UI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interior App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Home_UI(),
    );
  }
}

