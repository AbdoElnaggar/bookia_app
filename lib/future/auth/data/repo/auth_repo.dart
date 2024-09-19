// ignore_for_file: unused_local_variable, camel_case_types, depend_on_referenced_packages, body_might_complete_normally_nullable, dead_code, unused_catch_clause, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:bookia_app/core/constant/constant.dart';
import 'package:bookia_app/future/auth/data/models/request/registerPrams.dart';
import 'package:bookia_app/future/auth/data/models/response/register_respons_model/register_respons_model.dart';
import 'package:dio/dio.dart';

class Auth_repo{
 static Future <RegisterResponsModel?> register(RedisterPrams prams)async{
  
  try {
      String url =
         App_constant.url + App_constant.register;
      var response = await Dio().post(url, data: prams.toJson());
      
      if (response.statusCode == 201) {
        
        var model = RegisterResponsModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      
      return null;
    }}




//login
 static Future <RegisterResponsModel?> Login({required String email,required String password})async{
 
      String url =App_constant.url + App_constant.loginEndpoints;
      var response = await Dio().post(url,data:{"email":email, "password":password});
      if (response.statusCode == 200) {
        var model = RegisterResponsModel.fromJson(response.data);
        return model;
      } else { 
        return  null;
      }
    // } on Exception catch (e) {
    //   log("${response.data}");
      
    //   return null;
    // }
    }
     
}