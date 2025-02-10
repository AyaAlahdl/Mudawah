import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mudawah/models/user_models/add_doctor_rate_body.dart';
import 'package:mudawah/models/user_models/doctor.dart';
import 'package:mudawah/utils/app_constants.dart';

import '../../models/login_body.dart';
import '../api/api_client.dart';

class DoctorRepo {
  final ApiClient apiClient;

  DoctorRepo({required this.apiClient});

  Future<Response> getDoctors() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.getData(AppCostants.GET_ALL_USERS);
    print('repsonse post is : ${response.statusCode}');
    return response;
  }

  Future<Response> getDoctorPosts(int doctorId) async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = doctorId;
    Response response =
        await apiClient.postData(AppCostants.GET_DOCTOR_POSTS, data);
    return response;
  }

  Future<Response> getClinicsByDoctor(int doctorId) async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = doctorId;
    Response response =
        await apiClient.postData(AppCostants.GET_CLINICS_BY_DOCTOR, data);
    return response;
  }

  Future<Response> getDoctorRates(int doctorId) async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = doctorId;
    Response response =
        await apiClient.postData(AppCostants.GET_DOCTOR_RATES, data);
    print('repsonse post is : ${response.statusCode}');
    return response;
  }

  Future<Response> getDoctorAppointments() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.getData(AppCostants.GET_ALL_USERS);
    print('repsonse post is : ${response.statusCode}');
    return response;
  }

  Future<Response> addNewRate(AddRateBody addRateBody) async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.postData(
        AppCostants.ADD_NEW_RATE, addRateBody.toJson());
    return response;
  }
}
