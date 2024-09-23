// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, unnecessary_null_comparison, unused_import

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/home/presentation/pages/home/home_view.dart';
import 'package:bookia_app/future/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/custome_widget/nav_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    String token = ApplocalStorage.getData(key: ApplocalStorage.token) ?? '';
    Future.delayed(const Duration(seconds: 3), () {
      if (token.isNotEmpty) {
        pushrelacement(context, NavBar());
      } else {
        pushrelacement(context, const Welcome_view());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  SvgPicture.asset(Appicons.Logo),
            SizedBox(
              height: 15,
            ),
            Text(
              'Order Your Book Now!',
              style: getBodyTextStyle(context),
            )
          ],
        ),
      ),
    );
  }
}
