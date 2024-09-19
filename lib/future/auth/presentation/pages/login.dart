// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable

import 'dart:developer';

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/nav_bar.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/auth/data/models/request/registerPrams.dart';
import 'package:bookia_app/future/auth/presentation/blok/authBlok.dart';
import 'package:bookia_app/future/auth/presentation/blok/authEvent.dart';
import 'package:bookia_app/future/auth/presentation/blok/authState.dart';
import 'package:bookia_app/future/home/presentation/pages/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bookia_app/future/forget_passwored/forget_password.dart';
import 'package:bookia_app/future/auth/presentation/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/function/dialog.dart';

class login_view extends StatelessWidget {
  login_view({super.key});
  var formkey = GlobalKey<FormState>();
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBlok, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccesState) {
              Navigator.pop(context);
              pushrelacement(context, home_view());
            } else if (state is LoginErrorState) {
              Navigator.pop(context);
              showErrorDialog(context, state.error);
            } else if (state is LoginLoadingState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Lottie.asset('assets/image/loding.json');
                  });
            }
          },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
          body:  Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text(
                        'Welcome back! Gladto see \nyou, Again!',
                        style: getBodyTextStyle(
                          context,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailControl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Appcolor.border,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Your email",
                          hintStyle: getBodyTextStyle(context,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordControl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your Password";
                          }
                          else if(value.length<8){
                               return "password must  be 8 character";
                          }
                           else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Appcolor.border,
                          suffixIconConstraints: BoxConstraints(maxWidth: 33),
                          suffixIcon: Row(
                            children: [
                              SvgPicture.asset(
                                Appicons.Eye_svg,
                              )
                            ],
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Your Password",
                          hintStyle: getBodyTextStyle(context,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 200),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => forget_password()));
                            },
                            child: Text(
                              'Forget Password ?',
                              style: getBodyTextStyle(
                                context,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      custom_buttom(
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              context.read<AuthBlok>().add(LoginEvent(
                                    email: emailControl.text,
                                    password: passwordControl.text,
                                  ));
                            }
                          },
                          border: Appcolor.primary,
                          text: 'Login',
                          backg: Appcolor.primary,
                          textcolor: Colors.white),
                      SizedBox(
                        height: 35,
                      ),
                      Row(children: [
                        Expanded(
                            child: Divider(
                          thickness: 2,
                        )),
                        Text("  Or Login With  ",
                            style: getBodyTextStyle(
                              context,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                        )),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
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
                            style: getBodyTextStyle(context, fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => register_view()));
                            },
                            child: Text(' Register Now',
                                style: getBodyTextStyle(context,
                                    color: Appcolor.primary, fontSize: 15)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
