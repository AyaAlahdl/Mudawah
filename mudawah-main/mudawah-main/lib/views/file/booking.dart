import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/controllers/appointmentController.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/file/componets/book_card.dart';

import 'bookingcard.dart';
import 'mybooking.dart';

class booking extends StatefulWidget {
  const booking({Key? key}) : super(key: key);

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<AppointmentController>().getUserAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 50),
              //Upper
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: Text(
                      "حجوزاتي",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              //new ,old button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const bookingcard()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[400],
                      shadowColor: Colors.grey,
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 50, right: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "الجديدة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      shadowColor: Colors.grey,
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 50, right: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "القديمة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //cards
              SizedBox(
                height: height * 0.05,
              ),

              GetBuilder<AppointmentController>(
                builder: (controller) => Container(
                  height: SizeConfig.screenHeight * .7,
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                      itemCount: controller.disAppointmentsList.length,
                      itemBuilder: (BuildContext context, index) {
                        return BookCard(
                            appointment: controller.disAppointmentsList[index]);
                      }),
                ),
              )
              /*   Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mybooking()),
                          );
                        },
                        child: Container(
                          width: 250,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                            color: Color(0xff36c0d6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "د/ محمد ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "مستشفى عدن - المنصورة ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xfff5f5f5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "11:00 - 11:30 ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ": الوقت  ",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :المبلغ ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " :رقم الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "3000",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "ID-23456",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :عمر المريض",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ":أسم المريض ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "30",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " هاشم علي",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "تم",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "  :حالة الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mybooking()),
                          );
                        },
                        child: Container(
                          width: 87.95,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AUG\n10\n2022",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.cyan[700]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mybooking()),
                          );
                        },
                        child: Container(
                          width: 250,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                            color: Color(0xff36c0d6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "د/ محمد ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "مستشفى عدن - المنصورة ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xfff5f5f5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "11:00 - 11:30 ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ": الوقت  ",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :المبلغ ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " :رقم الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "3000",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "ID-23456",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :عمر المريض",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ":أسم المريض ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "30",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " هاشم علي",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "تم",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "  :حالة الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mybooking()),
                          );
                        },
                        child: Container(
                          width: 87.95,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AUG\n10\n2022",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.cyan[700]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          //my booking
                        },
                        child: Container(
                          width: 250,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                            color: Color(0xff36c0d6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "د/ محمد ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "مستشفى عدن - المنصورة ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xfff5f5f5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "11:00 - 11:30 ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ": الوقت  ",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :المبلغ ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " :رقم الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "3000",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "ID-23456",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :عمر المريض",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ":أسم المريض ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "30",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " هاشم علي",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "تم",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "  :حالة الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mybooking()),
                          );
                        },
                        child: Container(
                          width: 87.95,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AUG\n10\n2022",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.cyan[700]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mybooking()),
                          );
                        },
                        child: Container(
                          width: 250,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                            color: Color(0xff36c0d6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "د/ محمد ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "مستشفى عدن - المنصورة ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xfff5f5f5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "11:00 - 11:30 ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ": الوقت  ",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xfff5f5f5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :المبلغ ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " :رقم الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "3000",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "ID-23456",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " :عمر المريض",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ":أسم المريض ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "30",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " هاشم علي",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "تم",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xfff5f5f5),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "  :حالة الحجز ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mybooking()),
                          );
                        },
                        child: Container(
                          width: 87.95,
                          height: 244.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "AUG\n10\n2022",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.cyan[700]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
            */
            ],
          ),
        ),
      ),
    );
  }
}
