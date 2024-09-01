// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:bookia_app/core/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class Welcome_view extends StatelessWidget {
  const Welcome_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/back_image.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/image/logo.png.png'),
                      Text(
                        'Order Your Book Now!',
                        style: getBodyTextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Appcolor.text_color),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      custom_buttom(
                        text: 'Login',
                        backg: Appcolor.button_background,
                        textcolor: Colors.white,
                        border: Appcolor.button_background,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      custom_buttom(
                        text: 'Register',
                        backg: Colors.white,
                        textcolor:Colors.black,
                        border: Colors.black,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
