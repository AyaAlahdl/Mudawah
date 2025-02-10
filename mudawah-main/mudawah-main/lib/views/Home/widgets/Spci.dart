import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';

import 'package:mudawah/models/facibility_models/hospital.dart';
import 'package:mudawah/models/user_models/specializition.dart';

import '../../../models/doctor_model.dart';
import '../../../others/routes/routes.dart';

import 'package:mudawah/views/Home/show_all/screens/showAllDoctorsInCategory.dart';

import '../../hospital/hospital.dart';

InkWell SpcCard(BuildContext context, Specializitions spec) {
  double pagewidth = MediaQuery.of(context).size.width;
  double pageheight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () => Get.toNamed(Routes.hospital, arguments: {'hospital': spec}),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: cardscolor,
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: AssetImage(Doctor.profile[0].doctorimg),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 4,
                color: Colors.black12,
              ),
            ],
          ),
        ),
        Text(
          spec.name!,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 15,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
