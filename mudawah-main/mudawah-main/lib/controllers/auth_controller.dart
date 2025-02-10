import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/models/regisgor_body.dart';
import 'package:mudawah/models/user_models/update_phone_body.dart';
import 'package:mudawah/others/functions/check_internet.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../components/show_custom_snackbar.dart';
import '../data/repositories/auth_repository.dart';
import '../models/User.dart';
import '../models/login_body.dart';
import '../models/response_model.dart';
import 'package:mudawah/models/user_models/update_password.dart';

import '../models/user_models/phone_number.dart';

class AuthController extends GetxController {
  AuthRepo authRepo;
  bool isLoaded = false;
  int signUpLoaded = 0;
  int loginLoaded = 0;
  RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();
  get buttonController => _buttonController;

  AuthController({required this.authRepo});

  Future<ResponseModel> login(LoginBody loginBody) async {
    loginLoaded = 1;
    Response response = await authRepo.login(loginBody);
    ResponseModel responseModel;
    var jsonData = response.body;
    responseModel = ResponseModel(false, response.statusText!);
    log('login response is : ${response.statusCode}');
    if (response.statusCode == 200) {
      isLoaded = true;
      loginLoaded = 2;
      UserModel userModel = UserModel.fromJson(jsonData);
      handleRegisterCallBack(userModel);
      responseModel = ResponseModel(true, response.body['token']);
      print('done');
    } else if (response.statusCode == 422) {
      loginLoaded = 2;
      responseModel = ResponseModel(false, response.body['message']);
      //  _buttonController.stop();
      log('message is : ${responseModel.message}');
      handleValidationError(responseModel);
    } else {
      loginLoaded = 2;
      isLoaded = false;
      responseModel = ResponseModel(false, response.statusText!);
    }
    loginLoaded = 2;

    update();
    return responseModel;
  }

  Future<ResponseModel> register(RegisterBody registerBody) async {
    signUpLoaded = 1;
    update();
    Response response = await authRepo.register(registerBody);
    RegisterBody registerBody1;
    ResponseModel? responseModel;
    log('response register is :  ${response.statusCode}');
    print('body register is :  ${response.body}');
    if (response.statusCode == 200) {
      signUpLoaded = 2;
      var jsonData = response.body;
      responseModel = ResponseModel(true, '');
      handleRegisterCallBack(UserModel.fromJson(jsonData));
    } else if (response.statusCode == 422) {
      responseModel = ResponseModel(false, '');
      showCustomSnackBar('لقد تم تسجيل حساب بنفس الايميل مسبقاً');
    } else {
      signUpLoaded = 3;
    }
    update();
    return responseModel!;
  }

  Future<ResponseModel> updateUser(RegisterBody registerBody) async {
    Response response = await authRepo.updateUser(registerBody);
    RegisterBody registerBody1;
    ResponseModel? responseModel;
    print('response update is :  ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonData = response.body;
      responseModel = ResponseModel(true, '');
      handleUpdateUserCallBack(User.fromJson(jsonData));
    }
    return responseModel!;
  }

  Future<ResponseModel> addPoneNumber(PhoneNumber phoneNumber) async {
    Response response = await authRepo.addPhoneNumber(phoneNumber);
    var jsonData = response.body;
    RegisterBody registerBody1;
    ResponseModel? responseModel;
    print('response update is :  ${response.statusCode}');
    print('response phone body is :  ${response.body}');
    if (response.statusCode == 200) {
      // var jsonData = response.body;
      responseModel = ResponseModel(true, '');
      _handleAddPhoneNumber(responseModel, User.fromJson(response.body));
    } else {
      responseModel = ResponseModel(false, '');
    }

    //handleUpdateUserCallBack(User.fromJson(jsonData));

    return responseModel;
  }

  Future<ResponseModel> updatePhoneNumber(
      UpdatePhoneBody updatePhoneBody) async {
    Response response = await authRepo.updatePhoneNumber(updatePhoneBody);
    var jsonData = response.body;
    RegisterBody registerBody1;
    ResponseModel? responseModel;
    print('response update is :  ${response.statusCode}');
    print('response phone body is :  ${response.body}');
    if (response.statusCode == 200) {
      // var jsonData = response.body;
      responseModel = ResponseModel(true, '');
      _handleUpdatePhoneNumber(responseModel, User.fromJson(response.body));
    } else {
      responseModel = ResponseModel(false, '');
    }

    //handleUpdateUserCallBack(User.fromJson(jsonData));

    return responseModel;
  }

  Future<ResponseModel> updatePassword(
      UpdatePasswordBody updatePasswordBody) async {
    Response response = await authRepo.updatePassword(updatePasswordBody);
    var jsonData = response.body;
    ResponseModel? responseModel;
    print('response update is :  ${response.statusCode}');
    if (response.statusCode == 200) {
      // var jsonData = response.body;
      responseModel = ResponseModel(true, jsonData['res']);
    } else {
      responseModel = ResponseModel(false, '');
    }

    return responseModel;
  }

  handleValidationError(ResponseModel responseModel) {
    if (responseModel.message == 'Password mismatch') {
      _buttonController.error();
      _buttonController.stop();
      showCustomSnackBar(' كلمة المرور خطأ ، يرجى التأكد');
    }
  }

  handleRegisterCallBack(UserModel userModel) {
    //token handle
    String token = userModel.token!;
    authRepo.saveUserToken(token);
    //user handle
    User user = userModel.user!;
    storage.write('user', user.toJson());
    AppCostants.user = user;
    print('user is : ${user.toJson()}');
    // saveUserData(user.roleId!, user.name!, user.owner_id, user.id);
  }

  handleUpdateUserCallBack(User user) {
    //User user = user;
    storage.write('user', user.toJson());
    AppCostants.user = user;
  }

  _handleAddPhoneNumber(ResponseModel responseModel, User user) {
    if (responseModel.isSuccess) {
      showCustomSnackBar('تمت اضافة رقم هاتفك بنجاح');
      storage.write('user', user.toJson());
      AppCostants.user = user;
    }
  }

  _handleUpdatePhoneNumber(ResponseModel responseModel, User user) {
    if (responseModel.isSuccess) {
      showCustomSnackBar('تمت اضافة رقم هاتفك بنجاح');
      storage.write('user', user.toJson());
      AppCostants.user = user;
    }
  }
}
