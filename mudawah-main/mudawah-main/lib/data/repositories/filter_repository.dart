import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/models/User.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/models/user_models/filter_body.dart';
import 'package:mudawah/models/user_models/update_password.dart';
import 'package:mudawah/models/regisgor_body.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/accountsettings/phone.dart';

import '../../models/login_body.dart';
import '../../models/user_models/phone_number.dart';
import '../api/api_client.dart';

class FilterRepo {
  final ApiClient apiClient;

  FilterRepo({required this.apiClient});

  Future<Response> getSpecs() async {
    Response response =
        await apiClient.getData(AppCostants.GET_SPECIALLIZATION);
    return response;
  }

  Future<Response> getDoctorsFilter(FilterBody filterBody) async {
    print('filter body repo is : ${filterBody.toJson()}');
    Response response = await apiClient.postData(
        AppCostants.GET_DOCTORS_FILTER, filterBody.toJson());
    print('body repo is ${response.body}');

    return response;
  }
}
