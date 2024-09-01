// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import

import 'package:bookia_app/core/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class password_changed extends StatelessWidget {
  const password_changed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/Sticker.png'),
              Text(
                'Password Changed',
                style: getBodyTextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25,),
               Text('Your password has been changed\n                 successfully.',
                             style: getBodyTextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
             
              
              SizedBox(
                height: 25,
              ),
              custom_buttom(
                  border: Appcolor.button_background,
                  text: 'Password Changed',
                  backg: Appcolor.button_background,
                  textcolor: Colors.white),
              
            ],
          ),
        ),
      ),
    );
  }
}