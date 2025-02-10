import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mudawah/data/repositories/auth_repository.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/models/User.dart';

import '../../utils/app_constants.dart';
import '../routes/routes.dart';

class OnbaordingMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  @override
  RouteSettings? redirect(String? route) {
    if (storage.read('onBoarding') != null) {
      String s = storage.read('onBoarding');
      if (s != null) {
        return RouteSettings(name: Routes.loginScreen1);
      }
    }

    //starting the app
  }
}
