// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import

import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});

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
                'SUCCESS!',
                style: getBodyTextStyle(
                  context,fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25,),
               Text('Your order will be delivered soon.\nThank you for choosing our app!',
                             style: getBodyTextStyle(context,fontWeight: FontWeight.normal,fontSize: 18),),
             
              
              SizedBox(
                height: 25,
              ),
              custom_buttom(
                ontap: (){},
                  border: Appcolor.primary,
                  text: 'Back To Home',
                  backg: Appcolor.primary,
                  textcolor: Colors.white),
              
            ],
          ),
        ),
      ),
    );
  }
}