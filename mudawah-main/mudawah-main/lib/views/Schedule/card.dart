import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/views/appointment/appointment.dart';

import '../../others/routes/routes.dart';

class card extends StatefulWidget {
  const card({Key? key, required this.appointment}) : super(key: key);

  final Appointment appointment;
  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "حجز لديك موعد في [${widget.appointment.clinic.name}] ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.appointment.patientName,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(42),
                  border: Border.all(
                    color: Color(0xff39a2db),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x330df4d8),
                      blurRadius: 4,
                      offset: Offset(2, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 170, bottom: 15),
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.doctorBookingDetail,
                    arguments: {'appointment': widget.appointment});
              },
              child: Text(
                "انقر للتفاصيل",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
