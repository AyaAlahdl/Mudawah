import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mudawah/utils/app_constants.dart';

import '../../models/login_body.dart';
import '../api/api_client.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient});

  Future<Response> getUsers() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.getData(AppCostants.GET_ALL_USERS);
    print('repsonse post is : ${response.statusCode}');
    return response;
  }
}
