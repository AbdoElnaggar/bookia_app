// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/login/login.dart';
import 'package:bookia_app/future/register/register.dart';
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
                  
                    Spacer(flex: 1,),
                      Image.asset('assets/image/logo.png.png'),
                      Text(
                        'Order Your Book Now!',
                        style: getBodyTextStyle(
                           context, fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Appcolor.text_color),
                     
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Spacer(flex: 4,),
                      custom_buttom(
                        ontap: (){
                          push(context, login_view());
                        },
                        text: 'Login',
                        backg: Appcolor.primary,
                        textcolor: Colors.white,
                        border: Appcolor.primary,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      custom_buttom(
                        ontap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>register_view()));
                        },
                        text: 'Register',
                        backg: Colors.white,
                        textcolor:Colors.black,
                        border: Colors.black,
                      ),
                      Spacer(flex: 1,),
                    ],
                  
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
