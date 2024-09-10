// ignore_for_file: camel_case_types, must_be_immutable

import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';


import '../utlis/color/colors.dart';

class text_form_filed extends StatelessWidget {
  text_form_filed({super.key,required this.text,required this.obscure});
String text;

bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                obscureText: obscure,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Appcolor.border,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: text,
                    hintStyle: getBodyTextStyle(context,fontWeight: FontWeight.normal),
                    ),
              );
  }
}