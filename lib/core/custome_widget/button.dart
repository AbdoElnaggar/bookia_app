// ignore_for_file: camel_case_types, must_be_immutable, unused_import, body_might_complete_normally_nullable

import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import '../utlis/color/colors.dart';

class custom_buttom extends StatelessWidget {
  custom_buttom({
    super.key,
    required this.border,
    required this.text,
    required this.backg,
    required this.textcolor,
    required this.ontap(),
  });
  String text;
  Color backg;
  Color textcolor;
  Color border;

  Function() ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: border, width: 2),
              backgroundColor: backg,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            ontap();
          },
          child: Text(
            text,
            style: getBodyTextStyle(context,
                fontWeight: FontWeight.w400, fontSize: 22, color: textcolor),
          )),
    );
  }
}
