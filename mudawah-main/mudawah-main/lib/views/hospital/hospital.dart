import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/components/mudawah_SilverAppBar.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/models/facibility_models/hospital.dart';
import 'package:mudawah/views/Doctor/widgets/profileDetail.dart';

import 'widgets/hospitalProfile.dart';

class Hospital extends StatefulWidget {
  Hospital({Key? key}) : super(key: key);
  _hospitalState createState() => _hospitalState();
}

class _hospitalState extends State<Hospital> {
  var argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    HospitalJson hospital = argumentData['hospital'];
    return SafeArea(
        child: Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBar(
              expandedHeight: 200.0,
              imagePath: (hospital.image == null)
                  ? 'assets/ArticleHome/Hospital.png'
                  : hospital.image!,
              title: hospital.name!,
              isNetworkImage: (hospital.image == null) ? false : true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 120,
              ),
              HospitalProfile(
                hospital: hospital,
              ),
            ]),
          )
        ],
      ),
    ));
  }
}
