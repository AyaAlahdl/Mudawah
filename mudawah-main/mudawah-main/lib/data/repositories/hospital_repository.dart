import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mudawah/models/post_models/like_body.dart';
import 'package:mudawah/models/post_models/update_seen_body.dart';
import 'package:mudawah/utils/app_constants.dart';

import '../../models/login_body.dart';
import '../../models/post.dart';
import '../api/api_client.dart';

class HospitalRepo {
  final ApiClient apiClient;

  HospitalRepo({required this.apiClient});

  Future<Response> getHospitals() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response =
        await apiClient.getData(AppCostants.GET_HOSPITALS_WITH_ALL_DATA);
    print('repsonse post is : ${response.statusCode}');
    return response;
  }

  Future<Response> getDoctorsByClinic(int clinicId) async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinic_id'] = clinicId;
    Response response =
        await apiClient.postData(AppCostants.GET_DOCTORS_BY_CLINIC, data);
    return response;
  }

  Future<Response> getCliicsByHospital(int hospitalId) async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hospital_id'] = hospitalId;
    print('hospitalClinics body is: ${data}');
    Response response =
        await apiClient.postData(AppCostants.GET_CLINICS_BY_HOSPITAL, data);
    return response;
  }

  Future<Response> getDoctorsByHospital(int hospitalId) async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hospital_id'] = hospitalId;
    Response response =
        await apiClient.postData(AppCostants.GET_DOCTORS_BY_HOSPITAL, data);
    return response;
  }

  Future<Response> getAllClinics() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response =
        await apiClient.getData(AppCostants.GET_CLINICS_WITH_ALL_DATA);
    return response;
  }

  Future<Response> getRecentPosts() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.getData(AppCostants.GET_RECENT_POSTS);
    print('repsonse post is : ${response.statusCode}');
    return response;
  }

  Future<Response> updatePostSeen(UpdateSeenBody updateSeenBody) async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.postData(
        AppCostants.UPDATE_POST_SEEN, updateSeenBody.toJson());
    print('repsonse post is : ${response.statusCode}');
    return response;
  }

  Future<Response> likePost(LikeBody likeBody) async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    print(likeBody.toJson());
    Response response =
        await apiClient.postData(AppCostants.Add_POST_LIKE, likeBody.toJson());
    print('repsonse post is : ${response.statusCode}');
    return response;
  }
}
