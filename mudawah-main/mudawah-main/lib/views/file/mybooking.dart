import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';

import '../../others/size_config.dart';

class mybooking extends StatelessWidget {
  mybooking({Key? key}) : super(key: key);
  var argumentData = Get.arguments;
  Appointment? appointment;
  @override
  Widget build(BuildContext context) {
    appointment = argumentData['appointment'];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: CupertinoColors.white,
                child: Stack(
                  children: [
                    Container(
                      width: 428,
                      height: 316,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(120),
                          bottomRight: Radius.circular(0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0x70a8e377), Color(0xff00c9fd)],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.arrow_left,
                                    color: CupertinoColors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, left: 50, right: 50),
                            child: Center(
                              child: Text(
                                appointment!.doctor.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          /*        Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Center(
                          child: Text(
                            'appointment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                  */
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Center(
                              child: Text(
                                appointment!.clinic.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 240, left: 20),
                        child: Container(
                          //
                          width: 125,
                          height: 126,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 7,
                            ),
                            color: CupertinoColors.white,
                          ),
                          child: CircleAvatar(
                              backgroundImage:
                                  (appointment!.doctor.avatar == null)
                                      ? AssetImage(
                                          'images/user.png',
                                        ) as ImageProvider
                                      : getImageNetwork(
                                          appointment!.doctor.avatar)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 325,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "تفاصيل حجزك",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  CupertinoIcons.news_solid,
                                  color: CupertinoColors.systemTeal,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  appointment!.patientName,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":أسم المريض ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            /*       Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              appointment!.patientAge.toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff828282),
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              ":عمر المريض ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff828282),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                   */
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  appointment!.id.toString(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":رقم الحجز ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  (appointment!.date != null)
                                      ? appointment!.date
                                      : '',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":تاريخ الحجز ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  appointment!.time,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":وقت الحجز ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  appointment!.clinic.address,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":موقع ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${appointment!.price.toString()} ر.ي',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":الرسوم ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  appointment!.state.code,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  ":حالة الحجز",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            (appointment!.note != null)
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        appointment!.note,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xff828282),
                                          fontSize: 16,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        ":تفاصيل الحالة",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff828282),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /*   Center(
                    child: TextButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, //background color of button
                      //  side: BorderSide(width:3, color:Colors.white), //border width and color
                      elevation: 0, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.all(Radius.circular(43))),
                      padding: EdgeInsets.only(
                          left: 0, right: 0) //content padding inside button
                      ),
                  child: Container(
                    width: 250,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(46),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff00c9fd), Color(0x70a8e377)],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "الغاء الحجز",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                       Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, //background color of button
                            //  side: BorderSide(width:3, color:Colors.white), //border width and color
                            elevation: 0, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius:
                                    BorderRadius.all(Radius.circular(43))),
                            padding: EdgeInsets.only(
                                left: 0,
                                right: 0) //content padding inside button
                            ),
                        child: Container(
                          width: 91,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(46),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff00c9fd), Color(0x70a8e377)],
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "الغاء",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, //background color of button
                            //  side: BorderSide(width:3, color:Colors.white), //border width and color
                            elevation: 0, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius:
                                    BorderRadius.all(Radius.circular(43))),
                            padding: EdgeInsets.only(
                                left: 0,
                                right: 0) //content padding inside button
                            ),
                        child: Container(
                          width: 91,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(46),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff00c9fd), Color(0x70a8e377)],
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "تعديل",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
         */
                  ],
                ),
              ),
            ),
            /*    Positioned(
          bottom: SizeConfig.screenHeight * .03,
          child: Container(
            width: SizeConfig.screenWidth * .3,
            height: SizeConfig.screenHeight * .08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(46),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff00c9fd), Color(0x70a8e377)],
              ),
            ),
            child: Center(
              child: Text(
                "الغاء الحجز",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
     */
          ],
        ));
  }
}
