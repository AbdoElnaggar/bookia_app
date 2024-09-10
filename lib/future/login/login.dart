// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/nav_bar.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bookia_app/future/forget_passwored/forget_password.dart';
import 'package:bookia_app/future/register/register.dart';
import 'package:flutter/material.dart';

class login_view extends StatelessWidget {
  const login_view({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Appcolor.white,
            
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1),
          ),
          child: SvgPicture.asset(Appicons.Back_svg),
        ),
       ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Text(
                  'Welcome back! Gladto see \nyou, Again!',
                  style: getBodyTextStyle(
                    context,fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                text_form_filed(
                  obscure: false,
                  text: 'Ente your email',

                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                obscureText:true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Appcolor.border,
                  suffixIconConstraints: BoxConstraints(maxWidth: 33),
                  suffixIcon:Row(
                    children: [
                       SvgPicture.asset(Appicons.Eye_svg,
                    )
                    ],
                   ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                      
                    hintText:"Enter Your Password",
                    hintStyle: getBodyTextStyle(context,fontWeight: FontWeight.normal),
                    ),
              ),

                SizedBox(
                  height: 15,
                ),

                Container(
                    margin: EdgeInsets.only(left: 200),
                    child: InkWell(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>forget_password()));
                        },
                      child: Text(
                        'Forget Password ?',
                        style: getBodyTextStyle(context,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                custom_buttom(
                  ontap: () {
                   push(context, NavBar());
                  },
                    border: Appcolor.primary,
                    text: 'Login',
                    backg: Appcolor.primary,
                    textcolor: Colors.white),
                SizedBox(
                  height: 35,
                ),
                Row(children:[
                  Expanded(child: Divider(thickness: 2,)),
                  Text("  Or Login With  ",style:getBodyTextStyle(context,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,)),
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
                      style: getBodyTextStyle(context,fontSize: 15),
                    ),
                    InkWell(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>register_view()));
                        },
                      child: Text(' Register Now',
                          style: getBodyTextStyle(
                             context, color: Appcolor.primary, fontSize: 15)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
