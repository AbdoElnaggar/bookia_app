// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors_in_immutables, file_names

import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class OTP_view extends StatelessWidget {
  OTP_view({super.key});

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
              Text('OTP Verification',
                  style: gettitlestyle(context, fontSize: 15)),
              Text(
                'Enter the verification code we just sent on your email address.',
                style: getBodyTextStyle(context, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, left: 30),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Appcolor.primary, width: 2),
                        ),
                        child: Text('6',
                            style: getBodyTextStyle(context, fontSize: 25))),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, left: 30),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Appcolor.primary, width: 2),
                        ),
                        child: Text(
                          '8',
                          style: getBodyTextStyle(context, fontSize: 25),
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, left: 30),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Appcolor.primary, width: 2),
                        ),
                        child: Text(
                          '5',
                          style: getBodyTextStyle(context, fontSize: 25),
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, left: 30),
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Appcolor.primary, width: 2),
                        ),
                        child: Text(
                          '2',
                          style: getBodyTextStyle(context, fontSize: 25),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              custom_buttom(
                  ontap: () {},
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
