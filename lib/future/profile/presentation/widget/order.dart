// ignore_for_file: camel_case_types, unnecessary_const, must_be_immutable, prefer_const_constructors

import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profile_order extends StatelessWidget {
  profile_order({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Appcolor.primary),
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 45,
              // ),
              Text(
                title,
                style: getBodyTextStyle(context),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Vector (1).svg',
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
