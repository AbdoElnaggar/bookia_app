// ignore_for_file: camel_case_types, unused_catch_clause, unused_import, body_might_complete_normally_nullable, unused_local_variable
import 'dart:developer';

import 'package:bookia_app/core/constant/constant.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/future/auth/data/models/request/registerPrams.dart';
import 'package:bookia_app/future/auth/data/models/response/register_respons_model/register_respons_model.dart';
import 'package:bookia_app/future/home/date/model/home_banner_response_model/home_banner_response_model.dart';
import 'package:bookia_app/future/home/date/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/future/home/date/model/response/getWishList/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_app/future/home/presentation/bloc/home_bloc.dart';
import 'package:dio/dio.dart';





class HomeRepo {
  static Future<BestSellerResponseModel?> getBestSellerBooks() async {
    try {
      String url = App_constant.url + App_constant.BestSellerEndpoints;
      var response = await DioProvider.get(
          endpoint: App_constant.BestSellerEndpoints,
          headers: {
            "Authorization":
                "Bearer${ApplocalStorage.getData(key: ApplocalStorage.token)}"
          });
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

//banner

  static Future<HomeBannerResponseModel?> getHomeBanner() async {
    try {
      var response = await DioProvider.get(
          endpoint: App_constant.Bannerndpoints,
          headers: {
            "Authorization":
                "Bearer${ApplocalStorage.getData(key: ApplocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = HomeBannerResponseModel.fromJson(response.data);
      return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  //Wishlist

  static Future<GetWishlistResponseModel?> getWishlist() async {
    try {
      var response = await DioProvider.get(
          endpoint: App_constant.WishlistEndpoint,
          headers: {
            "Authorization":
                "Bearer ${ApplocalStorage.getData(key: ApplocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = GetWishlistResponseModel.fromJson(response.data);
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
