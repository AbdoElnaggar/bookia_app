// ignore_for_file: unused_import, prefer_const_constructors, override_on_non_overriding_member

import 'package:bookia_app/core/custome_widget/nav_bar.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/future/auth/presentation/blok/authBlok.dart';
import 'package:bookia_app/future/auth/presentation/pages/Otp_view.dart';
import 'package:bookia_app/future/home/presentation/pages/cart/cart_view.dart';
import 'package:bookia_app/future/congrats/congrats.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/future/home/presentation/pages/home/home_view.dart';
import 'package:bookia_app/future/intro/splash_view.dart';
import 'package:bookia_app/future/auth/presentation/pages/login.dart';
import 'package:bookia_app/future/auth/presentation/pages/register.dart';
import 'package:bookia_app/future/profile/presentation/block/bloc/profile_bloc.dart';
import 'package:bookia_app/future/profile/presentation/pages/profile_view.dart';
import 'package:bookia_app/future/profile/presentation/pages/updatePassword.dart';
import 'package:bookia_app/future/welcome/welcome.dart';
import 'package:bookia_app/future/home/presentation/pages/wishlist/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await ApplocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBlok(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome_view(),
      ),
    );
  }
}
