import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:flutter/material.dart';

class BackCardWidget extends StatelessWidget {
  const BackCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 41,
        height: 41,
        padding: const EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Appcolor.white,
          border: Border.all(color: Appcolor.border),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
    );
  }
}
