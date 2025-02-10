import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/models/User.dart';
import 'package:mudawah/models/user_models/update_password.dart';
import 'package:mudawah/models/regisgor_body.dart';
import 'package:mudawah/models/user_models/update_phone_body.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/accountsettings/phone.dart';

import '../../models/login_body.dart';
import '../../models/user_models/phone_number.dart';
import '../api/api_client.dart';

import 'package:dio/dio.dart' hide Response;

class AuthRepo {
  final ApiClient apiClient;

  AuthRepo({required this.apiClient});

  Future<Response> login(LoginBody loginBody) async {
    Response response =
        await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    return response;
  }

  Future<Response> register(RegisterBody registerBody) async {
    print('register body is ${registerBody.toJson()}');
    Response response = await apiClient.postData(
        AppCostants.REGIWTER_URL, registerBody.toJson());
    return response;
  }

  Future<Response> updateUser(RegisterBody registerBody) async {
    Response response = await apiClient.postData(
        AppCostants.UPDATE_USER_URL, registerBody.toJson());
    return response;
  }

  Future<void> uploadImage(XFile image) async {
    var stream = await http.ByteStream(image.openRead());
    stream.cast();
    var length = await image.length();
    var uri = Uri.parse(AppCostants.BASE_URI + AppCostants.UPDATE_USER_URL);
    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    request.fields['name'] = 'othman image';
    request.headers['Authorization'] = 'Bearer ${AppCostants.kToken}';
    //request.headers['Content-type']='application/json; charset=UTF-8';

    var multipart = http.MultipartFile('avatar', stream, length);
    request.files.add(multipart);
    var response = await request.send();
    print('image upload response is : ${response.statusCode}');
    if (response.statusCode == 200) {}
  }

  Future<Response> addPhoneNumber(PhoneNumber phoneNumber) async {
    print(phoneNumber.toJson());
    Response response = await apiClient.postData(
        AppCostants.ADD_USER_PHONE, phoneNumber.toJson());
    return response;
  }

  Future<Response> updatePhoneNumber(UpdatePhoneBody updatePhoneBody) async {
    // print(phoneNumber.toJson());
    Response response = await apiClient.postData(
        AppCostants.UPDATE_PHONE_NUMBER, updatePhoneBody.toJson());
    return response;
  }

  Future<Response> updatePassword(UpdatePasswordBody updatePasswordBody) async {
    print(updatePasswordBody.toJson());
    Response response = await apiClient.postData(
        AppCostants.UPDATE_PASSWORD, updatePasswordBody.toJson());
    return response;
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateToken(token);
    storage.write('token', token);
    print('token after save is : ${storage.read('token')}');
  }
}
