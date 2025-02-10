import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/user_models/update_phone_body.dart';

import '../../components/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../models/response_model.dart';
import '../../models/user_models/phone_number.dart';
//import 'package:mudawah/components/bottomNav.dart';

class resetphone extends StatefulWidget {
  const resetphone({Key? key}) : super(key: key);

  @override
  State<resetphone> createState() => _resetphonestat();
}

class _resetphonestat extends State<resetphone> {
  TextEditingController mOldPhoneText = TextEditingController();
  TextEditingController mNewPhoneText = TextEditingController();
  TextEditingController mNewPhoneTextconfirm = TextEditingController();
  _updatePhone() async {
    if (mNewPhoneText.text != mNewPhoneTextconfirm.text) {
      showCustomSnackBar('يرجى التأكد من تطابق رقم التلفون');
    } else {
      UpdatePhoneBody phoneNumber = UpdatePhoneBody(
          oldPhoneNumber: mOldPhoneText.text, phoneNumber: mNewPhoneText.text);
      ResponseModel responseModel =
          await Get.find<AuthController>().updatePhoneNumber(phoneNumber);
      //  AppCostants.user.phoneNumber[0] = phoneNumber;
      mOldPhoneText.clear();
      mNewPhoneText.clear();
      mNewPhoneTextconfirm.clear();
      if (responseModel.isSuccess) {
        Navigator.pop(context);
      }
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
                                    'رقم الهاتف القديم',
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
                                child: TextField(
                                  controller: mOldPhoneText,
                                  obscureText: false,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'رقم الهاتف الجديد',
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
                                child: TextField(
                                  controller: mNewPhoneText,
                                  obscureText: false,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ' تأكيد رقم الهاتف',
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
                                child: TextField(
                                  controller: mNewPhoneTextconfirm,
                                  obscureText: false,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0))),
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
                                      _updatePhone();
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
                              Text(
                                "الغاء",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
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
