// ignore_for_file: unused_import, prefer_const_constructors

import 'package:bookia_app/future/OTP/Otp_view.dart';
import 'package:bookia_app/future/creat_new_password/new_password.dart';
import 'package:bookia_app/future/forget_passwored/forget_password.dart';
import 'package:bookia_app/future/login/login.dart';
import 'package:bookia_app/future/password_changed/password_changed.dart';
import 'package:bookia_app/future/register/register.dart';
import 'package:bookia_app/future/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Welcome_view(),
    );
  }
}
