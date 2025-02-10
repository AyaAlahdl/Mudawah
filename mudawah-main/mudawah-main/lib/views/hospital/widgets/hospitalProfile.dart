import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/models/facibility_models/hospital.dart';
import 'package:mudawah/views/hospital/hospital.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../../controllers/hospital_controller.dart';
import '../../../others/size_config.dart';
import 'hospitalTabBar.dart';

class HospitalProfile extends StatefulWidget {
  const HospitalProfile({Key? key, required this.hospital}) : super(key: key);
  final HospitalJson hospital;
  _HospitalProfileState createState() => _HospitalProfileState();
}

class _HospitalProfileState extends State<HospitalProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.hospital.name,
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
        SizedBox(
          height: 10,
        ),
        Text(
          (widget.hospital.description != null)
              ? widget.hospital.description
              : '',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1,
            fontSize: 25,
            color: textcolor2,
          ),
        ),
        Text(
          widget.hospital.address,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            height: 1.5,
            fontSize: 20,
            color: textcolor2,
          ),
        ),
        (widget.hospital.phoneNumber != null)
            ? Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        UrlLauncher.launch(
                            "tel://${widget.hospital.phoneNumber[0]}");
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: SizeConfig.screenHeight * .06,
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
                        child: Center(
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
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
                      // child: TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'متابعة',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   style: ButtonStyle(
                      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //         side: BorderSide(
                      //           color: primeteilcolor,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              )
            : Container(),
        tabbarselect(hospital: widget.hospital),
      ],
    );
  }
}
