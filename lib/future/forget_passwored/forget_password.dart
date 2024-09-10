// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors_in_immutables

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class forget_password extends StatelessWidget {
 forget_password({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xffE8ECF4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forget Password',
                style: getBodyTextStyle(context,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Don\'t worry! It occurs. Please enter the email address linked with your account.',
              style: getBodyTextStyle(context,fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 25,
              ),
              text_form_filed(
                obscure: false,
                text: 'Ente your email',
                
              ),
              SizedBox(
                height: 25,
              ),
              
             
              custom_buttom(
                ontap: (){},
                  border: Appcolor.primary,
                  text: 'Send code',
                  backg: Appcolor.primary,
                  textcolor: Colors.white),
              
            ],
          ),
        ),
      ),
    );
  }
}