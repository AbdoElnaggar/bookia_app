// ignore_for_file: file_names, dead_code, unused_local_variable, unused_import

import 'dart:developer';
import 'package:bookia_app/core/constant/constant.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/future/profile/date/model/response/profile_response_model/profile_response_model.dart';

class ProfileRepo {
  static Future<ProfileResponseModel?> getProfileEvent() async {
    //try {
    var response =
        await DioProvider.get(endpoint: App_constant.Profilepoints, headers: {
      "Authorization": "Bearer ${ApplocalStorage.getData(
        key: ApplocalStorage.token,
      )}"
    }, data: {});
    if (response.statusCode == 200) {
      log(response.data.toString());
      var model = ProfileResponseModel.fromJson(response.data);
      return model;
    } else {
      log(response.data);
      log(response.statusCode.toString());
      return null;
    }

    //  }
    //  on Exception catch (e) {
    //    log(e.toString());
    //    return null;
    //   }
  }
}
