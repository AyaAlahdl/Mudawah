import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/controllers/appointmentController.dart';
import 'package:mudawah/utils/app_constants.dart';
//import 'package:mudawah/components/bottomNav.dart';
import 'package:mudawah/views/accountSettings/phone.dart';
import 'package:mudawah/views/accountSettings/resetpassword.dart';
import 'package:mudawah/views/accountSettings/resetphone.dart';

import '../../helper/depedencies.dart';
import '../../others/routes/routes.dart';

class settings1 extends StatefulWidget {
  const settings1({Key? key}) : super(key: key);

  @override
  State<settings1> createState() => _settings1State();
}

class _settings1State extends State<settings1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
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
                        Row(
                          children: <Widget>[
                            Spacer(
                              flex: 5,
                            ),
                            Text(
                              'اسم المستخدم',
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
                            Icon(CupertinoIcons.person_circle,
                                size: 50, color: Color(0xff39A2DB)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'حسابي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(127, 138, 142, 1),
                                  fontFamily: 'Almira',
                                  fontSize: 18,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            )
                          ],
                        ),
                        /*             Padding(
                          padding: const EdgeInsets.only(top: 0.0, right: 5.0),
                          child: Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return resetpassword();
                                  }));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.white,
                                    shadowColor: Colors.white,
                                    side: BorderSide.none,
                                    elevation: 0.0,
                                    padding: EdgeInsets.all(0.0)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      CupertinoIcons.back,
                                      color: Color(0xff39A2DB),
                                    ),
                                    Spacer(),
                                    Text(
                                      'كلمة المرور',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff39A2DB),
                                          fontFamily: 'Almira',
                                          fontSize: 18,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ],
                                )),
                          ),
                        ),
             */
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, right: 5.0),
                          child: Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return phone();
                                  }));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.white,
                                  side: BorderSide.none,
                                  elevation: 0.0,
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      CupertinoIcons.back,
                                      color: Color(0xff39A2DB),
                                      size: 24,
                                    ),
                                    Spacer(),
                                    Text(
                                      'رقم الهاتف  ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff39A2DB),
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        /*  Divider(),
                                Padding(
                          padding: const EdgeInsets.only(top: 30.0, right: 5),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'الاشعارات',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(127, 138, 142, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 15),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Switch(
                                  value: true,
                                  onChanged: null,
                                ),
                                Spacer(),
                                Text(
                                  'عرض الاشعارات',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff39A2DB),
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        
                        */
                        Divider(),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 25.0, right: 10.0),
                          child: Container(
                            child: ElevatedButton(
                                onPressed: _exitDialog,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.white,
                                  side: BorderSide.none,
                                  elevation: 0.0,
                                  padding: EdgeInsets.all(0.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Spacer(
                                      flex: 10,
                                    ),
                                    Text(
                                      'تسجيل الخروج',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(127, 138, 142, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Icon(CupertinoIcons.square_arrow_right,
                                        color: Color(0xff39A2DB)),
                                  ],
                                )),
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

  Future<void> _exitDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            // content: const Text("هل تريد تسجيل الخروج؟"),
            content: Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/settings/Telemedicine.png',
                  scale: 1.0,
                  width: 100.0,
                  height: 100.0,
                ),
                Text("هل تريد تسجيل الخروج؟"),
              ],
            )),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Get.find<AppointmentController>().handleLogout();
                  // Navigator.pop(context, "Yes");
                  storage.remove('token');
                  AppCostants.kToken = '';
                  storage.remove('user');
                  Get.offAndToNamed(Routes.loginScreen1);
                },
                child: Text("نعم"),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("لا"),
              )
            ],
          );
        });
  }
}
