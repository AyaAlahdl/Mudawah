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
import 'package:mudawah/models/user_models/update_password.dart';
import 'package:mudawah/models/regisgor_body.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/accountsettings/phone.dart';

import '../../models/login_body.dart';
import '../../models/user_models/phone_number.dart';
import '../api/api_client.dart';

class LocationRepo {
  final ApiClient apiClient;

  LocationRepo({required this.apiClient});

  Future<Response> getDirectorates() async {
    Response response = await apiClient.getData(AppCostants.GET_DIRECTORATES);
    return response;
  }
}
