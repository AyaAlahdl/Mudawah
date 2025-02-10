import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/others/size_config.dart';

import '../../../others/routes/routes.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.appointment}) : super(key: key);
  final Appointment appointment;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                print('hi');
                Get.toNamed(Routes.mybooking,
                    arguments: {'appointment': appointment});
              },
              child: Container(
                width: SizeConfig.screenHeight * .3,
                height: SizeConfig.screenHeight * .3,
                decoration: const BoxDecoration(
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
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        appointment.doctor!.name!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xfff5f5f5),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      appointment.clinic!.address!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xfff5f5f5),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 140),
                      child: Text(
                        "الوقت ",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0xfff5f5f5),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1, left: 80),
                      child: Text(
                        appointment.time!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xfff5f5f5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "المبلغ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xfff5f5f5),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "رقم الحجز ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xfff5f5f5),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            appointment.price.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfff5f5f5),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            appointment.id.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfff5f5f5),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
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
                /*
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const mybooking()),
                );*/
              },
              child: Container(
                width: 87.95,
                height: SizeConfig.screenHeight * .3,
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    (appointment.date != null) ? appointment.date : 'not added',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.cyan[700]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
