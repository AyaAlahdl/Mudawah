// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/data/repositories/doctor_repository.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/Doctor/widgets/ProfileTabBar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/User.dart';
import '../../../models/doctor_model.dart';
import '../../../models/user_models/doctor.dart';
import '../../../others/routes/routes.dart';

class profiledetail extends StatefulWidget {
  const profiledetail({Key? key, required this.doctor}) : super(key: key);
  final Doctorr doctor;

  @override
  State<profiledetail> createState() => _profiledetailState();
}

class _profiledetailState extends State<profiledetail> {
  @override
  void initState() {
    Get.put(DoctorRepo(apiClient: Get.find()));
    Get.put(DoctorController(doctorRepo: Get.find()));
    Get.find<DoctorController>().getClinicByDoctors(widget.doctor.id);

    //Get.find<DoctorController>().disDoctorPosts=[];
    Get.find<DoctorController>().getDoctorPosts(widget.doctor.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.doctor.name,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                height: 1,
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          // '${widget.doctor.specializitions.length<-0}',
          (widget.doctor.specializitions.length <= 0)
              ? ''
              : widget.doctor.specializitions[0].name,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            height: 1,
            fontSize: 25,
            color: textcolor2,
          ),
        ),
        /* Text(
          'Doctor.profile[0].doclocation',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            height: 1.5,
            fontSize: 20,
            color: textcolor2,
          ),
        ),
        
        */
        (widget.doctor.phoneNumber != null)
            ? Container()
            : InkWell(
                onTap: () {
                  log('hi');
                  //${widget.doctor.phoneNumber[0]
                  launch("tel://3113133}");
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: SizeConfig.screenWidth * .2,
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
                          onPressed: () {
                            showCustomSnackBar('لا يوجد رقم تلفون مُضاف ');
                            log(widget.doctor.toJson().toString());

                            // launch("tel://${widget.doctor.phoneNumber[1]}");
                          },
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
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
                    ],
                  ),
                ),
              ),
        tabbarselect(
          doctor: widget.doctor,
        ),
      ],
    );
  }
}
