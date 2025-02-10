// ignore_for_file: unnecessary_string_interpolations, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

import '../../colors.dart';
import 'linkButton.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final kTitleStyle = TextStyle(
    color: Color(0xff05cafd),
    fontSize: 20.0,
    height: 1.0,
  );
  final kSubTitleStyle = TextStyle(
    //color: Colors.black,
    fontSize: 18.0,
    height: 1.0,
  );
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
                top: 30,
                left: 0,
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
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    )),
                              ]))),
                    ]))),
            Positioned(
                top: 35,
                left: width / 2 - 42,
                child: Text(
                  'طرق الدفع',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      // fontFamily: 'Roboto',
                      fontSize: 28,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: width - 50.0,
                  height: height - 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      // bottomLeft: Radius.circular(16),
                      // bottomRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      // BoxShadow(
                      //   color: Color.fromRGBO(75, 75, 75, 0.15000000596046448),
                      //   offset: Offset(2.0, 0),
                      //   blurRadius: 16,
                      //   spreadRadius: 8,
                      // ),
                      BoxShadow(color: Colors.white, offset: Offset(0, -5)),
                      BoxShadow(color: Colors.white, offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, -5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 5)),
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Flexible(
                              child: Text(
                                'لحجز موعد مع طبيب في تطبيق مداواة قم ب ايداع مبلغ الحجز في بنك الكريمي على الحساب التالي: ',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('أنس طلال محمد سعيد ',
                                  style: kSubTitleStyle),
                            ),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Flexible(
                                  child:
                                      Text('اسم الحساب: ', style: kTitleStyle),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          //crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child:
                                  Text('304-029-3627 ', style: kSubTitleStyle),
                            ),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Flexible(
                                  child:
                                      Text('رقم الحساب: ', style: kTitleStyle),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('220-851-85 ', style: kSubTitleStyle),
                            ),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Flexible(
                                  child:
                                      Text('رقم المميز: ', style: kTitleStyle),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              //color: Colors.blue,
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/onBoarding/pngs/QR.jpg'),
                                fit: BoxFit.fill,
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Text('في تطبيق الكريمي ' + 'َQR' + ' او قم بمسح رمز'),
                        //  Text(' او قم بمسح رمز  في تطبيق الكريمي '),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 55,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xff00C9FD),
                                  Color(0xff84DFB4),
                                ],
                              ),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                // //  Navigator.pop(context);
                                final bytes = await rootBundle
                                    .load('assets/onBoarding/pngs/QR.jpg');
                                final list = bytes.buffer.asUint8List();

                                final tempDir = await getTemporaryDirectory();
                                final file =
                                    await File('${tempDir.path}/QR.jpg')
                                        .create();
                                file.writeAsBytesSync(list);
                                Share.shareFiles(['${file.path}'],
                                    text: 'مشاركة رمز QR');

                                // //  _controller.close();
                              },
                              child: Text(
                                'مشاركة',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: primeteilcolor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [

                        //     Icon(
                        //       Icons.info_outline,
                        //       color: Colors.blueAccent,
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          verticalDirection: VerticalDirection.up,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //  TextButton(onPressed: () {}, child: Text('هنا')),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: Flexible(
                                    child: RichText(
                                  text: TextSpan(
                                      text:
                                          'قم بالتواصل معنا وتزويدنا باسم صاحب الحساب المودع منه واسم المريض ورقم الحجز من اجل تاكيد الحجز من ',
                                      style: TextStyle(color: Colors.black),
                                      children: const <InlineSpan>[
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.baseline,
                                          baseline: TextBaseline.alphabetic,
                                          child: LinkButton(
                                              urlLabel: "هنا",
                                              url:
                                                  "https://wa.me/message/L6HE4PP77W2QI1"),
                                        ),
                                      ]),
                                ))

                                // child: Flexible(
                                //     child: Text(
                                //         'قم بالتواصل معنا وتزويدنا باسم صاحب الحساب المودع منه واسم المريض ورقم الحجز من اجل تاكيد الحجز من ')
                                //         )
                                ),
                            // Icon(
                            //   Icons.info_outline,
                            //   color: Colors.blueAccent,
                            // ),
                          ],
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
  }

  openwhatsapp() async {
    var whatsapp = "+919144040888";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}
