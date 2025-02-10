import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/components/auth_button.dart';
import 'package:mudawah/components/auth_text_field.dart';
import 'package:mudawah/helper/depedencies.dart';
import 'package:mudawah/others/functions/check_internet.dart';
import 'package:mudawah/others/routes/routes.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/components/link_text.dart';

import '../../../../components/show_custom_snackbar.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../models/login_body.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController mEmailController = TextEditingController();
  TextEditingController mPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();

    _login() {
      String name = mEmailController.text;
      String password = mPasswordController.text;
      FocusManager.instance.primaryFocus?.unfocus();

      if (name.isEmpty) {
        showCustomSnackBar('من فضلك ادخل ايميلك', title: 'الاسم');
        authController.buttonController.stop();
      } else if (password.isEmpty) {
        showCustomSnackBar('من فضلك ادخل كلمة المرور', title: 'كلمة المرور');
        authController.buttonController.stop();
      } else {
        LoginBody loginBody = LoginBody(name: name, password: password);
        authController.login(loginBody).then((status) {
          if (status.isSuccess) {
            authController.buttonController.success();
            Get.offAndToNamed(Routes.bottomNavations);
          } else {
            if (status.message == 'Password mismatch') {
              authController.buttonController.error();
              authController.buttonController.stop();
              showCustomSnackBar(' كلمة المرور خطأ ، يرجى التأكد');
            } else if (status.message == "User does not exist") {
              // authController.buttonController.error();
              //   authController.buttonController.stop();
              log('message is not exists i:${status.message}');
              showCustomSnackBar(
                  ' المستخدم غير موجود أو أن الايميل الذي ادخلته غير صحيح');
            }
          }
        });
      }
    }

    return GetBuilder<AuthController>(
      builder: (controller) => (controller.loginLoaded == 1)
          ? Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: SpinKitWave(
                color: textcolor1,
                size: 80.0,
              ),
            )
          : SingleChildScrollView(
              child: Column(children: [
              SizedBox(
                height: SizeConfig.screenHeight * .08,
              ),
              _buildLogo(),
              SizedBox(
                height: SizeConfig.screenHeight * .03,
              ),
              Text(
                'تسجيل الدخول',
                style: TextStyle(
                    color: textcolor1, fontSize: SizeConfig.screenWidth * .05),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * .02,
              ),
              Text(
                'سجل الآن للوصول إلى طبيبك',
                style: TextStyle(
                    color: textcolor2, fontSize: SizeConfig.screenWidth * .05),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * .04,
              ),
              AuthTextField(
                hintText: 'البريد الالكتروني',
                isPassword: false,
                controller: mEmailController,
              ),
              SizedBox(height: SizeConfig.screenHeight * .02),
              AuthTextField(
                hintText: 'كلمة المرور',
                isPassword: true,
                controller: mPasswordController,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * .02,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * .07,
              ),
              Container(
                height: SizeConfig.screenHeight * .08,
                width: SizeConfig.screenWidth * .8,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin:
                          Alignment(-2.051272218750455e-8, -1.4947367906570435),
                      end: Alignment(1.4947367906570435, -9.226483577151612e-9),
                      colors: [
                        Color.fromRGBO(152, 223, 225, 1),
                        Color.fromRGBO(136, 194, 231, 1)
                      ]),
                ),
                child: TextButton(
                    onPressed: () async {
                      print('hi');
                      if (await checkInternet()) {
                       _login();
                      } else {
                        showCustomSnackBar('يرجى الاتصال بالانترنت');
                      }
                    },
                    child:
                        Text('تسجيل الدخول', style: TextStyle(fontSize: 15))),
              ),
              /* AuthButton(
              text: 'تسجيل الدخول',
              press: () {
                _login();
              },
              //   buttonController: controller.buttonController
            ),*/
              SizedBox(
                height: SizeConfig.screenHeight * .03,
              ),
              TextLink(
                  text: 'إنشاء حساب',
                  press: () {
                    Get.toNamed(Routes.SignupScreen);
                  },
                  type: 2),
              Container(
                  width: 600,
                  height: 175,
                  child: Image.asset(
                    'assets/singupimage/pic.png',
                    fit: BoxFit.cover,
                  )),
            ])),
    );
  }

  Widget _buildLogo() {
    return Container(
        height: 109.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login/logoscreen.png'),
          ),
          borderRadius: BorderRadius.all(const Radius.circular(8.0)),
        ));
  }
}
