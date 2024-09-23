// ignore_for_file: unused_local_variable, camel_case_types, depend_on_referenced_packages, body_might_complete_normally_nullable, dead_code, unused_catch_clause, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:bookia_app/core/constant/constant.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/future/auth/data/models/request/registerPrams.dart';
import 'package:bookia_app/future/auth/data/models/response/register_respons_model/register_respons_model.dart';
import 'package:dio/dio.dart';

class Auth_repo {
  static Future<RegisterResponsModel?> register(RedisterPrams prams) async {
    //register
    try {
      String url = App_constant.url + App_constant.register;
      var response = await DioProvider.post(
          endpoint: App_constant.register,
          data: prams.toJson(),
          headers: {
            "Authorization":
                "Bearer${ApplocalStorage.getData(key: ApplocalStorage.token)}"
          });

      if (response.statusCode == 201) {
        var model = RegisterResponsModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }

//login
  static Future<RegisterResponsModel?> Login(
      {required String email, required String password}) async {
    String url = App_constant.url + App_constant.loginEndpoints;
    var response = await DioProvider.post(
        endpoint: App_constant.loginEndpoints,
        data: {
          "email": email,
          "password": password
        },
        headers: {
          "Authorization":
              "Bearer${ApplocalStorage.getData(key: ApplocalStorage.token)}"
        });
    if (response.statusCode == 200) {
      var model = RegisterResponsModel.fromJson(response.data);
      return model;
    } else {
      return null;
    }
    // } on Exception catch (e) {
    //   log("${response.data}");

    //   return null;
    // }
  }
}
