// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class social_media extends StatelessWidget {
  social_media({super.key, required this.path});
  String path;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Image.asset(path),
      ),
    );
  }
}
