// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/components/mudawah_SilverAppBar.dart';
import 'package:mudawah/models/User.dart';
import 'package:mudawah/models/user_models/doctor.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/Doctor/widgets/profileDetail.dart';

import '../../controllers/doctor_controller.dart';
import '../../models/doctor_model.dart';

class DoctorProfile extends StatefulWidget {
  DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  initState() {
    //   Get.find<DoctorController>().getDoctorPosts(widget.doctor.id);
  }

  late Doctorr doctor;

  var argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    doctor = argumentData['doctor'];
    return SafeArea(
        child: Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBar(
                expandedHeight: 200.0,
                imagePath: (doctor.avatar == null)
                    ? Doctor.profile[0].doctorimg
                    : doctor.avatar,
                title: '',
                isNetworkImage: (doctor.avatar == null) ? false : true),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 120,
              ),
              profiledetail(doctor: doctor),
            ]),
          )
        ],
      ),
    ));
  }
}
