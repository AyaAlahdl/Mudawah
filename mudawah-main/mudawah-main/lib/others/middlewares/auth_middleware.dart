import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mudawah/data/repositories/auth_repository.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/models/User.dart';

import '../../utils/app_constants.dart';
import '../routes/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  @override
  RouteSettings? redirect(String? route) {
    print('hello middleware othman');
    if (storage.read('token') != null)
      AppCostants.kToken = storage.read('token');

    print('token is: : ${AppCostants.kToken}');
    String token = AppCostants.kToken;

    if (token != '') {
      print('hello middleware othman token');
      Get.find<AuthRepo>().saveUserToken(AppCostants.kToken);
      //save user object
      if (storage.read('user') != null) {
        var userobj = storage.read('user');
        AppCostants.user = User.fromJson(userobj);
        print('user middle is : ${AppCostants.user}');
      }
      //starting the app
      return RouteSettings(name: Routes.bottomNavations);
    }
  }
}
