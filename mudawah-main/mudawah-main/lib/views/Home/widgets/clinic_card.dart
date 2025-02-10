import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/models/Posts.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/models/facibility_models/clinic.dart';
import 'package:mudawah/models/facibility_models/hospital.dart';
import 'package:mudawah/others/size_config.dart';

import '../../../others/functions/get_image_from_iternet.dart';
import '../../../others/routes/routes.dart';
import '../../Hospital/Hospital.dart';
import 'package:mudawah/views/Home/show_all/screens/showAllDoctorsInCategory.dart';

import '../../hospital/hospital.dart';

//select function
void SelectHospital(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(
    builder: (c) => ShowAllDoctorCategory(),
  ));
}

InkWell ClinicCard(BuildContext context, HospitalJson hospital) {
  double pagewidth = MediaQuery.of(context).size.width;
  double pageheight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () =>
        Get.toNamed(Routes.hospital, arguments: {'hospital': hospital}),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: cardscolor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: primeteilcolor,
              width: 2,
            ),
            image: DecorationImage(
              image: (hospital.image == null)
                  ? AssetImage('assets/ArticleHome/Hospital.png')
                      as ImageProvider
                  : getImageNetwork(hospital.image),
              fit: BoxFit.fill,
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
        SizedBox(
          width: SizeConfig.screenWidth * .24,
          child: Text(
            hospital.name!,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            maxLines: 2,
            style: TextStyle(
              fontSize: 15,
              height: 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
