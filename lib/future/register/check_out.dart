// ignore_for_file: prefer_const_constructors

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1),
          ),
          child: SvgPicture.asset(Appicons.Back_svg),
        ),
        centerTitle: true,
        title: Text('Checkout',style: getBodyTextStyle(context),)
       ),

       body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              
              SizedBox(
                height: 15,
              ),
              text_form_filed(
                obscure: false,
                text: 'Full Name',
               
              ),
              SizedBox(
                height: 15,
              ),
              text_form_filed(
                obscure: false,
                text: 'Email',
              
              ),
              SizedBox(
                height: 15,
              ),
               TextFormField(
                
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Appcolor.border,
                  suffixIconConstraints: BoxConstraints(maxWidth: 33),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Adress',
                    hintStyle: getBodyTextStyle(context,fontWeight: FontWeight.normal),
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              text_form_filed(
                obscure: false,
                text: 'Phone',
              
              ),
              SizedBox(
                height: 15,
              ),
               TextFormField(
                obscureText: true,
                
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Appcolor.border,
                  suffixIconConstraints: BoxConstraints(maxWidth: 33),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  hintText: 'Note',
                  hintStyle: getBodyTextStyle(context,fontWeight: FontWeight.normal),
                    ),
              ),
         Spacer(),
              Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: getSmallTextStyle(context,fontSize: 20),
                      ),
                      Text(
                        '\$95',
                        style: getBodyTextStyle(context,fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  custom_buttom(
                      border: Appcolor.primary,
                      text: 'Submit Order',
                      backg: Appcolor.primary,
                      textcolor: Appcolor.white,
                      ontap: () {})
                ],
              ),
            ),
          ])
    ));
  }
}