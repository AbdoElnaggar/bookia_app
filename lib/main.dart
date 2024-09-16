// ignore_for_file: unused_import, prefer_const_constructors, override_on_non_overriding_member

import 'package:bookia_app/core/custome_widget/nav_bar.dart';
import 'package:bookia_app/future/OTP/Otp_view.dart';
import 'package:bookia_app/future/auth/presentation/blok/authBlok.dart';
import 'package:bookia_app/future/cart/presentation/pages/cart_view.dart';
import 'package:bookia_app/future/congrats/congrats.dart';
import 'package:bookia_app/future/creat_new_password/new_password.dart';
import 'package:bookia_app/future/forget_passwored/forget_password.dart';
import 'package:bookia_app/future/home/presentation/pages/home_view.dart';
import 'package:bookia_app/future/intro/splash_view.dart';
import 'package:bookia_app/future/auth/presentation/pages/login.dart';
import 'package:bookia_app/future/password_changed/password_changed.dart';
import 'package:bookia_app/future/auth/presentation/pages/register.dart';
import 'package:bookia_app/future/welcome/welcome.dart';
import 'package:bookia_app/future/wishlist.dart/presentation/pages/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'future/register/check_out.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBlok(),
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome_view(),
      ),
    );
  }
}
