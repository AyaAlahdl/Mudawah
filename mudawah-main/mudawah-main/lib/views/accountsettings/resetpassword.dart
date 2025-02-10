import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mudawah/components/link_text.dart';
import 'package:mudawah/components/password_text_field.dart';
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/controllers/auth_controller.dart';
import 'package:mudawah/models/response_model.dart';
import 'package:mudawah/models/user_models/update_password.dart';
import 'package:mudawah/others/functions/check_internet.dart';
import 'package:mudawah/others/size_config.dart';
//import 'package:mudawah/components/bottomNav.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);
  @override
  State<resetpassword> createState() => _resetpasswordstat();
}

class _resetpasswordstat extends State<resetpassword> {
  TextEditingController mOldPasswordController = TextEditingController();
  TextEditingController mNewPassword1Controller = TextEditingController();
  TextEditingController mNewPassword2Controller = TextEditingController();
  _handleResetPasswordCallBack(ResponseModel responseModel) {
    if (responseModel.isSuccess) {
      if (responseModel.message ==
          'Your current password does not matches with the password.') {
        showCustomSnackBar(
            'كلمة المرور القديمة التي ادخلتها غير صحيحة ، يرجى التحقق');
      }
      if (responseModel.message ==
          'errorNew Password cannot be same as your current password.') {
        showCustomSnackBar(
            'كلمة المرور الجديدة لا يمكن أن تكون مطابقة للقديمة');
      }
    }
    if (responseModel.message == 'Password successfully changed!') {
      showCustomSnackBar('تم تحديث كلمة المرور الخاصة بك بنجاح👏');
      Navigator.pop(context);
    }
  }

  _resetPassword() async {
    UpdatePasswordBody updatePasswordBody = UpdatePasswordBody(
        currentPassword: mOldPasswordController.text,
        newPassword: mNewPassword1Controller.text,
        newPasswordConfirmation: mNewPassword2Controller.text);

    if (await checkInternet()) {
      if (mNewPassword1Controller.text == null ||
          mNewPassword2Controller.text == null ||
          mOldPasswordController.text == null) {
        showCustomSnackBar('يرجى إدخال كافة البيانات ');
      } else {
        ResponseModel responseModel =
            await Get.find<AuthController>().updatePassword(updatePasswordBody);
        _handleResetPasswordCallBack(responseModel);
      }
    } else {
      showCustomSnackBar('يرجى الاتصال بالانترنت');
      print('no internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // height: height ,
        // width: width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                width: width,
                height: 315.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                      begin:
                          Alignment(-2.051272218750455e-8, -1.4947367906570435),
                      end: Alignment(1.4947367906570435, -9.226483577151612e-9),
                      colors: [
                        Color.fromRGBO(152, 223, 225, 1),
                        Color.fromRGBO(136, 194, 231, 1)
                      ]),
                )),
            Positioned(
                top: 70,
                left: 300,
                child: Container(
                    width: 40,
                    height: 40,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 50,
                              height: 40,
                              child: Stack(children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Image.asset(
                                    'assets/bottomNav/Settings.png',
                                    color: Colors.white,
                                  ),
                                ),
                              ]))),
                    ]))),
            Positioned(
                top: 70,
                left: 180,
                child: Text(
                  'الاعدادات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Roboto',
                      fontSize: 28,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
              top: 60,
              left: 5.0,
              child: IconButton(
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: width - 50.0,
                  height: height - 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color:
                              Color.fromRGBO(75, 75, 75, 0.15000000596046448),
                          offset: Offset(0, 2),
                          blurRadius: 16)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Spacer(
                                  flex: 5,
                                ),
                                Text(
                                  'حسابي',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(127, 138, 142, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                                Spacer(),
                                // Icon(CupertinoIcons.bandage, size: 35, color: Color(0xff39A2DB )),
                                Image.asset(
                                  'assets/settings/bandage.png',
                                  color: Color(0xff39A2DB),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, left: 10.0, right: 10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'كلمة المرور القديمة',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(127, 138, 142, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.bold,
                                        height: 1),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 48.0,
                                child: PasswordTextField(
                                  controller: mOldPasswordController,
                                  hintText: '',
                                  isPassword: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'كلمة المرور الجديدة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(127, 138, 142, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 48.0,
                                child: PasswordTextField(
                                  controller: mNewPassword1Controller,
                                  hintText: '',
                                  isPassword: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'تاكيد كلمة المرور الجديدة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(127, 138, 142, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 48.0,
                                child: PasswordTextField(
                                  controller: mNewPassword2Controller,
                                  hintText: '',
                                  isPassword: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  width: 320.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(92, 197, 218, 0.5),
                                          offset: Offset(0, 4),
                                          blurRadius: 4)
                                    ],
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.center,
                                        end: FractionalOffset.bottomRight,
                                        colors: [
                                          Color.fromRGBO(
                                              28, 174, 255, 0.8399999737739563),
                                          Color.fromRGBO(
                                              0, 197, 215, 0.33000001311302185),
                                          Color.fromRGBO(
                                              0, 197, 215, 0.33000001311302185)
                                        ]),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      print('Hello!');
                                      _resetPassword();
                                    },
                                    child: Text(
                                      "موافق",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              //),
                              SizedBox(
                                height: height * .04,
                              ),
                              TextLink(
                                text: "الغاء",
                                press: () {
                                  Navigator.pop(context);
                                },
                                type: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //bottomNavigationBar: BottomNav(context),
  }
}
