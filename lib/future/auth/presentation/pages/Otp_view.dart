// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors_in_immutables, file_names

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/custome_widget/social_medai.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class OTP_view extends StatelessWidget {
  OTP_view({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            child: InkWell(
                onTap: () {}, child: SvgPicture.asset(Appicons.Back_svg)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('OTP Verification',
                  style: gettitlestyle(context, fontSize: 35)),
              Text(
                'Enter the verification code we just sent on your email address.',
                style: getBodyTextStyle(context,
                    fontWeight: FontWeight.normal, fontSize: 22),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: Pinput(
                  followingPinTheme: PinTheme(
                      height: 60,
                      width: 60,
                      textStyle: TextStyle(fontSize: 22, color: Appcolor.black),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolor.white)),
                  length: 4,
                  onChanged: (value) {
                    // Code to execute when there is a change in the entered values
                  },
                ),
              ),
              SizedBox(
                height: 45,
              ),
              custom_buttom(
                  ontap: () {},
                  border: Appcolor.primary,
                  text: 'Send code',
                  backg: Appcolor.primary,
                  textcolor: Colors.white),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn’t received code?',
                    style: getBodyTextStyle(context, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text('  Resend',
                        style: getBodyTextStyle(context,
                            color: Appcolor.primary, fontSize: 15)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                       padding: EdgeInsets.only(top: 17, left: 30),
//                       height: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Appcolor.primary, width: 2),
//                       ),
//                       child: Text('6',
//                           style: getBodyTextStyle(context, fontSize: 25))),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Expanded(
//                   child: Container(
//                       padding: EdgeInsets.only(top: 17, left: 30),
//                       height: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Appcolor.primary, width: 2),
//                       ),
//                       child: Text(
//                         '8',
//                         style: getBodyTextStyle(context, fontSize: 25),
//                       )),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Expanded(
//                   child: Container(
//                       padding: EdgeInsets.only(top: 17, left: 30),
//                       height: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Appcolor.primary, width: 2),
//                       ),
//                       child: Text(
//                         '5',
//                         style: getBodyTextStyle(context, fontSize: 25),
//                       )),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Expanded(
//                   child: Container(
//                       padding: EdgeInsets.only(top: 17, left: 30),
//                       height: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Appcolor.primary, width: 2),
//                       ),
//                       child: Text(
//                         '2',
//                         style: getBodyTextStyle(context, fontSize: 25),
//                       )),
//                 ),
//               ],
//             ),
