import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/models/User.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/models/appointment_models/get_work_days_model_body.dart';
import 'package:mudawah/models/appointment_models/update_state_body.dart';
import 'package:mudawah/models/user_models/update_password.dart';
import 'package:mudawah/models/regisgor_body.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/accountsettings/phone.dart';

import '../../models/login_body.dart';
import '../../models/user_models/phone_number.dart';
import '../api/api_client.dart';

class AppointmentRepo {
  final ApiClient apiClient;

  AppointmentRepo({required this.apiClient});

  Future<Response> sendAppointment(Appointment appointment) async {
    log(appointment.toJson().toString());
    Response response = await apiClient.postData(
        AppCostants.ADD_NEW_APPOINTMENT, appointment.toJson());
    return response;
  }

  Future<Response> getUserAppointments() async {
    Response response =
        await apiClient.getData(AppCostants.GET_USER_APPOINTMENTS);
    return response;
  }

  Future<Response> getDoctorAppointments() async {
    Response response =
        await apiClient.getData(AppCostants.GET_DOCTOR_APPOINTMENTS);
    return response;
  }

  Future<Response> getWorkDays(GetWorkDaysBody getWorkDaysBody) async {
    Response response = await apiClient.postData(
        AppCostants.GET_WORK_DAYS, getWorkDaysBody.toJson());
    return response;
  }

  Future<Response> updateAppointmentState(
      UpdateAppointmentState updateAppointmentState) async {
    print('appointment update ${updateAppointmentState.toJson()}');
    Response response = await apiClient.postData(
        AppCostants.UPDATE_APPOINTMENT_STATE, updateAppointmentState.toJson());
    return response;
  }
}
