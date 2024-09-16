// ignore_for_file: camel_case_types, prefer_const_constructors, use_build_context_synchronously

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/welcome/welcome.dart';
import 'package:flutter/material.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({super.key});

  @override
  State<Splash_view> createState() => _Splash_viewState();
}

class _Splash_viewState extends State<Splash_view> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      push(context, Welcome_view());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(Appicons.Logo),
          SizedBox(
            height: 10,
          ),
          Text(
            'Order Your Book Now',
            style: getBodyTextStyle(
              context,
            ),
          ),
        ]),
      ),
    );
  }
}
