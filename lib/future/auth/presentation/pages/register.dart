// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import, unused_label, must_be_immutable

import 'dart:developer';

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/function/dialog.dart';
import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/auth/data/models/request/registerPrams.dart';
import 'package:bookia_app/future/auth/presentation/blok/authBlok.dart';
import 'package:bookia_app/future/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blok/authEvent.dart';
import '../blok/authState.dart';
import 'login.dart';

class register_view extends StatelessWidget {
  register_view({super.key});
  bool pass1 = true;
  bool pass2 = true;
  var formkey = GlobalKey<FormState>();
  var nameControl = TextEditingController();
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();
  var confirmpasswordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlok, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccesState) {
          pushrelacement(context, home_view());
        } else if (state is RegisterErrorState) {
          showErrorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
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
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Hello! Register to get started',
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
                        controller: nameControl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Appcolor.border,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Your Name",
                          hintStyle: getBodyTextStyle(context,
                              fontWeight: FontWeight.normal),
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
                          hintText: "Enter Your Email",
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
                            return "Enter Your password";
                          }
                          return null;
                        },
                        obscureText: pass1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Appcolor.border,
                          suffixIconConstraints: BoxConstraints(maxWidth: 33),
                          suffixIcon: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  pass1 != pass1;
                                },
                                child: SvgPicture.asset(
                                  Appicons.Eye_svg,
                                ),
                              )
                            ],
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter Password',
                          hintStyle: getBodyTextStyle(context,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: confirmpasswordControl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your Confirmation password";
                          }

                          return null;
                        },
                        obscureText: pass2,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Appcolor.border,
                          suffixIconConstraints: BoxConstraints(maxWidth: 33),
                          suffixIcon: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  pass2 != pass2;
                                },
                                child: SvgPicture.asset(
                                  Appicons.Eye_svg,
                                ),
                              )
                            ],
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Confirm Password',
                          hintStyle: getBodyTextStyle(context,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      state is RegisterLoadingState
                          ? const CircularProgressIndicator()
                          : custom_buttom(
                              ontap: () {
                                if (formkey.currentState!.validate()) {
                                  context
                                      .read<AuthBlok>()
                                      .add(AuthRegstergEvent(RedisterPrams(
                                        name: nameControl.text,
                                        email: emailControl.text,
                                        password: passwordControl.text,
                                        passwordConfirmation:
                                            confirmpasswordControl.text,
                                      )));
                                }
                              },
                              border: Appcolor.primary,
                              text: 'Register',
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
                                      builder: (context) => login_view()));
                            },
                            child: Text('  Login Now',
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
        );
      },
    );
  }
}
