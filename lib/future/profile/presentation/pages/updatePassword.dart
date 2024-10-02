// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, unused_import, must_be_immutable

import 'package:bookia_app/core/constant/assset_iocns.dart';
import 'package:bookia_app/core/function/dialog.dart';
import 'package:bookia_app/core/function/navigator.dart';
import 'package:bookia_app/core/utlis/color/colors.dart';
import 'package:bookia_app/core/custome_widget/button.dart';
import 'package:bookia_app/core/custome_widget/form_filed.dart';
import 'package:bookia_app/core/utlis/text_style.dart';
import 'package:bookia_app/future/auth/presentation/pages/login.dart';
import 'package:bookia_app/future/profile/presentation/block/bloc/profile_bloc.dart';
import 'package:bookia_app/future/profile/presentation/pages/profile_view.dart';
import 'package:bookia_app/future/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Updatepassword extends StatelessWidget {
  Updatepassword({super.key});
var formkey = GlobalKey<FormState>();
  var currenPassControl = TextEditingController();
  var newpasswordControl = TextEditingController();
  var confirmpasswordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return BlocListener<ProfileBloc,ProfileState>(
          listener: (context, state) {
            if(state is UpdatePasswordSuccesState){
              showsuccessDialog(context, "Password Updated sucsses");
            }
            else if(state is UpdatePasswordLoadingState){
              showLoadingDialog(context);
            }
            else if(state is UpdatePasswordErrorState){
             showErrorDialog(context, "Error occered");
            }
          },
    child:   SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xffE8ECF4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
                onPressed: () {
                  push(context, profile_view());
                },
                icon: SvgPicture.asset(Appicons.Back_svg)),
          ),
        ),
        body: 
             Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Update Password',
                    style: getBodyTextStyle(
                      context,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller:currenPassControl ,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter current Password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Appcolor.border,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Your current Password",
                      hintStyle:
                          getBodyTextStyle(context, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: newpasswordControl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter New Password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Appcolor.border,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter New Password",
                      hintStyle:
                          getBodyTextStyle(context, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: confirmpasswordControl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "confirm Password";
                      } else if (value.length < 8) {
                        return "password must  be 8 character";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Appcolor.border,
                      suffixIconConstraints: BoxConstraints(maxWidth: 33),
                      suffixIcon: Row(
                        children: [
                          SvgPicture.asset(
                            Appicons.Eye_svg,
                          )
                        ],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "confirm Password",
                      hintStyle:
                          getBodyTextStyle(context, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  custom_buttom(
                      ontap: () {
                        if(formkey.currentState!.validate()){
                  context.read<ProfileBloc>().add(GetUpdatePasswordEvent(
                    current_password:currenPassControl.text, 
                    new_password: newpasswordControl.text, 
                    new_password_confirmation:confirmpasswordControl.text,
                    
                  ));
                        }
                        
                      },
                      border: Appcolor.primary,
                      text: 'Update Password',
                      backg: Appcolor.primary,
                      textcolor: Colors.white),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
          
          
        ),
      ),
    );
  }
}
