// ignore_for_file: unused_local_variable, camel_case_types, depend_on_referenced_packages, body_might_complete_normally_nullable, dead_code, unused_catch_clause, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:bookia_app/core/constant/constant.dart';
import 'package:bookia_app/future/auth/data/models/request/registerPrams.dart';
import 'package:bookia_app/future/auth/data/models/response/register_respons_model/register_respons_model.dart';
import 'package:http/http.dart'as http;
class Auth_repo{
 static Future <RegisterResponsModel?> register(RedisterPrams prams)async{
  
  try {
      Uri url =
          Uri.parse(App_constant.url + App_constant.register);
      var response = await http.post(url, body: prams.toJson());
      
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        var model = RegisterResponsModel.fromJson(jsonResponse);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      
      return null;
    }}




//login

     static Future <RegisterResponsModel?> login({required String email,required String password})async{
  
  try {
      Uri url =
          Uri.parse(App_constant.url + App_constant.loginEndpoints);
      var response = await http.post(url,body:{"email":email,"password":password});
      
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var model = RegisterResponsModel.fromJson(jsonResponse);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      
      return null;
    }}
}