import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/controllers/auth_controller.dart';
import 'package:mudawah/controllers/hospital_controller.dart';
import 'package:mudawah/models/regisgor_body.dart';

import '../../components/auth_text_field.dart';
import '../../models/response_model.dart';
import '../../others/routes/routes.dart';
import '../../others/size_config.dart';
import '../loginSys/login_screen/login_screen.dart';
//import 'package:mudawah/loginSys/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _signupState();
}

class _signupState extends State<SignupScreen> {
  _signupState() {
    _value = _List[0];
  }
  String name = "";
  //DropdownButton
  String? _value = "عميل";
  final _List = ["عميل", "طبيب"];
  TextEditingController mNameController = TextEditingController();
  TextEditingController mEmailController = TextEditingController();
  TextEditingController mPasswordController = TextEditingController();
  int _checkAcountType(String type) {
    int r = 4;
    if (type == 'طبيب') {
      r = 5;
    } else if (type == 'عميل') {
      r = 4;
    }
    return r;
  }

  _register() async {
    var controller = Get.find<AuthController>();

    if (mNameController.text == '') {
      showCustomSnackBar('يرجى ادخال الاسم');
    } else if (mEmailController.text == '') {
      showCustomSnackBar('يرجى ادخال البريد الالكتروني');
    } else if (mPasswordController.text == '') {
      showCustomSnackBar('يرجى ادخال كلمة المرور ');
    } else {
      int role_id = _checkAcountType(_value!);
      RegisterBody registerBody = RegisterBody(
          rolId: role_id.toString(),
          name: mNameController.text,
          email: mEmailController.text,
          password: mPasswordController.text);
      ResponseModel responseModel = await controller.register(registerBody);
      if (responseModel.isSuccess) {
        showCustomSnackBar('تم تسجيل حساب جديد بنجاح');
        // Get.find<HospitalController>().getAllClinicsData();
        Get.offAndToNamed(Routes.bottomNavations);
      } else {
        showCustomSnackBar('حدث خطأما !', title: 'فشل');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return GetBuilder<AuthController>(
      builder: (controller) => (controller.signUpLoaded == 1)
          ? Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: SpinKitWave(
                color: textcolor1,
                size: 80.0,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 340),
                    child: IconButton(
                      splashColor: Colors.cyan[100],
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.cyan,
                      ),
                      tooltip: 'رجوع',
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('تم')));
                      },
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              body: ListView(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(right: 40, left: 40),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'انشاء حساب',
                            style: TextStyle(
                                color: Colors.grey[700],
                                shadows: [
                                  Shadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: Offset(0, 4),
                                      blurRadius: 4)
                                ],
                                fontSize: 35,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: DropdownButtonFormField(
                                items: _List.map(
                                  (e) => DropdownMenuItem(
                                      child: Text(e), value: e),
                                ).toList(),
                                value: _value,
                                alignment: AlignmentDirectional.centerEnd,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan,
                                    fontSize: 20),
                                iconEnabledColor: Colors.cyan,
                                iconSize: 40,
                                decoration: const InputDecoration(
                                  helperText: "اختر نوع الحساب",
                                  helperStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    _value = val as String;
                                    _checkAcountType(val);
                                    print('val is $val');
                                  });
                                }),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextFormField(
                            textAlign: TextAlign.right,
                            controller: mNameController,
                            decoration: const InputDecoration(
                              hintText: "الاسم",
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: TextStyle(
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            keyboardType: TextInputType.name,
                            maxLength: 20,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextFormField(
                            controller: mEmailController,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                              hintText: "البريد الاكتروني",
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: TextStyle(
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          AuthTextField(
                            hintText: 'كلمة المرور',
                            isPassword: true,
                            controller: mPasswordController,
                          ),
                          /*          TextFormField(
                                textAlign: TextAlign.right,
                                controller: mPasswordController,
                                decoration: const InputDecoration(
                                  hintText: "كلمة السر",
                                  hintTextDirection: TextDirection.rtl,
                                  hintStyle: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                     */
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Container(
                            //  textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                padding: EdgeInsets.only(left: 2, right: 2),
                              ),
                              onPressed: () {
                                //if (formKey.currentState!.validate()) {
                                final snackbar =
                                    SnackBar(content: Text('انشاء'));
                                //      _scaffoldkey.currentState!.showSnackBar(snackbar);
                                //_register();
                                // }
                              },
                              //   textColor: Colors.white,
                              //   padding: const EdgeInsets.all(0.0),
                              child: InkWell(
                                onTap: () {
                                  //Get.offAndToNamed(Routes.bottomNavations);
                                  _register();
                                },
                                child: Container(
                                  height: 50.0,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.0, 0.0),
                                      end: Alignment(1, 0.001),
                                      colors: <Color>[
                                        Color(0xff00F2D5),
                                        Colors.white
                                      ],
                                    ),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: const Text(
                                    "انشاء",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return LoginScreen1();
                                    }));
                                  },
                                  child: Text(
                                    'تسجيل الدخول',
                                    style: TextStyle(
                                        color: Colors.cyan,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Text(
                                'هل لديك حساب؟',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: 600,
                      height: 175,
                      child: Image.asset(
                        'assets/singupimage/pic.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )),
    );
  }
}
