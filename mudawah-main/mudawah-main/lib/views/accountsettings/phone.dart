import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/accountSettings/addphone.dart';
import 'package:mudawah/views/accountSettings/resetphone.dart';

class phone extends StatefulWidget {
  const phone({Key? key}) : super(key: key);

  @override
  State<phone> createState() => _phonestat();
}

class _phonestat extends State<phone> {
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
                                    'رقم هاتفك',
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
                              Row(
                                children: <Widget>[
                                  //  Icon(Icons.edit, size: 25, color: Color(0xff39A2DB )),
                                  Spacer(),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.white,
                                      shadowColor: Colors.white,
                                      side: BorderSide.none,
                                      elevation: 0.0,
                                      padding: EdgeInsets.all(0.0),
                                    ),
                                    onPressed: () {
                                      if (!(AppCostants
                                          .user.phoneNumber.isEmpty)) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return resetphone();
                                        }));
                                      } else {
                                        showCustomSnackBar(
                                            'لا يوجد لديك رقم هاتف لتعديله ، يرجى إضافة رقم هاتف أولاً');
                                      }
                                    },
                                    icon: Icon(Icons.edit,
                                        size: 25, color: Color(0xff39A2DB)),
                                    label: Text(
                                      'تعديل',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                  ),

                                  Spacer(
                                    flex: 10,
                                  ),
                                  Text(
                                    (AppCostants.user.phoneNumber.isEmpty)
                                        ? 'لا يوجد لديك رقم هاتف  بعد'
                                        : AppCostants
                                            .user
                                            .phoneNumber[AppCostants
                                                    .user.phoneNumber.length -
                                                1]
                                            .phoneNumber!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff5ECBE3),
                                        fontFamily: 'Roboto',
                                        fontSize: 17,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                              Divider(),
                              (AppCostants.user.phoneNumber.isEmpty)
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return addphone();
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
                                                size: 24,
                                              ),
                                              Spacer(),
                                              Text(
                                                'اضافة رقم هاتف',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        127, 138, 142, 1),
                                                    fontFamily: 'Roboto',
                                                    fontSize: 18,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1),
                                              ),
                                            ],
                                          )),
                                    )
                                  : Container(),
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

  Future<void> _deletePhone() async {
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
                Text("هل حقا تريد حذف رقم الهاتف؟"),
              ],
            )),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context, "Yes");
                },
                child: Text("نعم"),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context, "No");
                },
                child: Text("لا"),
              )
            ],
          );
        });
  }
}
