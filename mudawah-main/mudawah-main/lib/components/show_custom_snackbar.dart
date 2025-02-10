import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mudawah/colors.dart';

void showCustomSnackBar(String message,
    {int timeToLeave = 3, bool isError = true, String title = ''}) {
  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: timeToLeave),
    titleText: Text(title, style: TextStyle(color: textcolor1)),
    backgroundColor: textcolor1,
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white, fontSize: 24),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
  );
}
