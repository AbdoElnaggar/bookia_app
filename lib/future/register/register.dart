// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import

import 'package:bookia_app/core/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class register_view extends StatelessWidget {
  const register_view({super.key});

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
            children: [
              Text(
                'Hello! Register to get started',
                style: getBodyTextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              text_form_filed(
                obscure: false,
                text: 'User Name',
                icon: null,
              ),
              SizedBox(
                height: 15,
              ),
              text_form_filed(
                obscure: false,
                text: 'Email',
                icon: null,
              ),
              SizedBox(
                height: 15,
              ),
               text_form_filed(
                obscure: true,
                text: 'Password',
                icon:null,
              ),
              SizedBox(
                height: 15,
              ),
               text_form_filed(
                obscure: true,
                text: 'Confirm password',
                icon:null,
              ),
              
              SizedBox(
                height: 15,
              ),
              custom_buttom(
                  border: Appcolor.button_background,
                  text: 'Register',
                  backg: Appcolor.button_background,
                  textcolor: Colors.white),
              SizedBox(
                height: 35,
              ),
              Row(children:[
                Expanded(child: Divider(thickness: 2,)),
                Text("  Or Login With  ",style:getBodyTextStyle()),
                Expanded(child: Divider(thickness: 2,)),
              ]),
          
             SizedBox(height: 15,),
              Row(
                children: [
                  social_media(path: 'assets/image/facebook_ic.png'),
                  SizedBox(
                    width: 15,
                  ),
                  social_media(path: 'assets/image/google_ic.png'),
                  SizedBox(
                    width: 15,
                  ),
                  social_media(path: 'assets/image/cib_apple.png')
                ],
              ),
              SizedBox(
                height: 15,
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: getBodyTextStyle(fontSize: 15),
                  ),
                  Text(' Register Now',
                      style: getBodyTextStyle(
                          color: Appcolor.button_background, fontSize: 15))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}