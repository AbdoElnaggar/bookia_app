import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

showErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Appcolor.red,
    content: Text(text),
  ));
}

showsuccessDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(text),
  ));
}

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SnackBar(
          content: const Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
      });
}
