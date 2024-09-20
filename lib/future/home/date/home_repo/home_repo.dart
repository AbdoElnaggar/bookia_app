// ignore_for_file: camel_case_types, unused_catch_clause, unused_import, body_might_complete_normally_nullable
import 'dart:developer';

import 'package:bookia_app/core/constant/constant.dart';
import 'package:bookia_app/future/auth/data/models/request/registerPrams.dart';
import 'package:bookia_app/future/auth/data/models/response/register_respons_model/register_respons_model.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static Future<BestSellerResponseModel?> getBestSellerBooks() async {
    
    try {
      String url = App_constant.url + App_constant.BestSellerEndpoints;
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        var model = BestSellerResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
