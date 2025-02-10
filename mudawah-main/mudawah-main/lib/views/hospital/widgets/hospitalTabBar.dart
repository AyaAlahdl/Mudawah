// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/controllers/hospital_controller.dart';
import 'package:mudawah/views/Doctor/widgets/BlogPost.dart';
import 'package:mudawah/views/Doctor/widgets/DocInformation.dart';
import 'package:mudawah/views/Doctor/widgets/DocReview.dart';
import 'package:mudawah/views/hospital/components/doctortab.dart';
import 'package:mudawah/views/hospital/components/tabItem.dart';
import 'package:mudawah/models/facibility_models/hospital.dart';
import 'devices.dart';

class tabbarselect extends StatefulWidget {
  const tabbarselect({Key? key, required this.hospital}) : super(key: key);
  final HospitalJson hospital;
  @override
  State<tabbarselect> createState() => _tabbarselectState();
}

class _tabbarselectState extends State<tabbarselect>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  _getData() {
    Get.find<HospitalController>().getHospitalClinics(widget.hospital.id);
    if (widget.hospital.type == 'h') {
      Get.find<HospitalController>().getHospitalDoctors(widget.hospital.id);
    } else {
      Get.find<HospitalController>().getClinicDoctors(widget.hospital.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var hospitalTabs = [
      Tab(text: 'العيادات'),
      Tab(text: 'الاطباء'),
      Tab(text: 'الاجهزة'),
    ];
    var clinicTabs = [
      Tab(text: 'الاطباء'),
      Tab(text: 'الاجهزة'),
    ];

    TabController _tabController = TabController(
        length: (widget.hospital.type == 'h') ? 3 : 2, vsync: this);
    return Column(
      children: [
        Container(
          child: TabBar(
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.only(left: 5, right: 5),
              unselectedLabelColor: textcolor2,
              labelStyle:
                  TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),
              controller: _tabController,
              tabs: (widget.hospital.type == 'h') ? hospitalTabs : clinicTabs),
        ),
        (widget.hospital.type == 'h')
            ? Container(
                width: double.maxFinite,
                height: 700,
                child: GetBuilder<HospitalController>(
                  builder: (hospitalController) => TabBarView(
                    controller: _tabController,
                    children: [
                      hospitalController.clinicsHospitalLoaded == 1
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: SpinKitWave(
                                color: textcolor1,
                                size: 150.0,
                              ),
                            )
                          : (hospitalController.hospitalClinicsList.isEmpty)
                              ? EmptyWidget(
                                  image: null,
                                  title: 'No clinics',
                                  subTitle:
                                      '  no clinics found in this hospital',
                                  titleTextStyle: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xff9da9c7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  subtitleTextStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffabb8d6),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: hospitalController
                                      .hospitalClinicsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return TabItem(
                                      hospital: hospitalController
                                          .hospitalClinicsList![index],
                                      title: hospitalController
                                          .hospitalClinicsList![index].name!,
                                      sub: '',
                                      imageType: (hospitalController
                                                  .hospitalClinicsList[index]
                                                  .image ==
                                              null)
                                          ? 0
                                          : 1,
                                      image: (hospitalController
                                                  .hospitalClinicsList[index]
                                                  .image !=
                                              null)
                                          ? widget
                                              .hospital.clinics[index].image!
                                          : 'assets/ArticleHome/clinic.png',
                                      content: hospitalController
                                                  .hospitalClinicsList![index]
                                                  .description !=
                                              null
                                          ? hospitalController
                                              .hospitalClinicsList![index]
                                              .description!
                                          : '',
                                    );
                                  }),

                      //build hospital doctors
                      (hospitalController.hospitalDoctorsList.isEmpty)
                          ? EmptyWidget(
                              image: null,
                              title: 'No doctors',
                              subTitle: 'No  no doctors in this list',
                              titleTextStyle: TextStyle(
                                fontSize: 22,
                                color: Color(0xff9da9c7),
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleTextStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xffabb8d6),
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  hospitalController.hospitalDoctorsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return DoctorTab(
                                  doctor: hospitalController
                                      .hospitalDoctorsList[index],
                                  name: hospitalController
                                      .hospitalDoctorsList[index].name,
                                  img: (hospitalController
                                              .hospitalDoctorsList[index]
                                              .avatar !=
                                          null)
                                      ? hospitalController
                                          .hospitalDoctorsList[index].avatar
                                      : 'assets/splashscreen/user.png',
                                  imageType: (hospitalController
                                              .hospitalDoctorsList[index]
                                              .avatar ==
                                          null)
                                      ? 0
                                      : 1,
                                  price: 3000,
                                  time1to: '12:00',
                                  time1from: '08:00',
                                  time2from: '03:00',
                                  time2to: '20:00',
                                  clinic: hospitalController
                                              .hospitalDoctorsList[index]
                                              .description ==
                                          null
                                      ? ''
                                      : hospitalController
                                          .hospitalDoctorsList[index]
                                          .description,
                                  daysfrom: 'الاحد',
                                  stars: double.tryParse(hospitalController
                                      .hospitalDoctorsList[index].rate_average
                                      .toString()),
                                  daysto: 'الخميس',
                                );
                              },
                            ),
                      // reviews(),

                      (widget.hospital.devices.isNotEmpty)
                          ? Devices(devices: widget.hospital.devices)
                          : EmptyWidget(
                              image: null,
                              title: 'No devices',
                              subTitle: 'No   devices found',
                              titleTextStyle: TextStyle(
                                fontSize: 22,
                                color: Color(0xff9da9c7),
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleTextStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xffabb8d6),
                              ),
                            ),
                      // reviews(),
                      //info(),
                    ],
                  ),
                ),
              )
            : Container(
                width: double.maxFinite,
                height: 700,
                child: GetBuilder<HospitalController>(
                  builder: (hospitalController) => TabBarView(
                    controller: _tabController,
                    children: [
                      (hospitalController.clinicDoctorsList.isEmpty)
                          ? EmptyWidget(
                              image: null,
                              title: 'No doctors',
                              subTitle: 'No  no doctors in this list',
                              titleTextStyle: TextStyle(
                                fontSize: 22,
                                color: Color(0xff9da9c7),
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleTextStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xffabb8d6),
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  hospitalController.clinicDoctorsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return DoctorTab(
                                  doctor: hospitalController
                                      .clinicDoctorsList[index],
                                  name: hospitalController
                                      .clinicDoctorsList[index].name,
                                  img: (hospitalController
                                              .clinicDoctorsList[index]
                                              .avatar !=
                                          null)
                                      ? hospitalController
                                          .clinicDoctorsList[index].avatar
                                      : 'assets/splashscreen/user.png',
                                  imageType: (hospitalController
                                              .clinicDoctorsList[index]
                                              .avatar ==
                                          null)
                                      ? 0
                                      : 1,
                                  price: 3000,
                                  time1to: '12:00',
                                  time1from: '08:00',
                                  time2from: '03:00',
                                  time2to: '20:00',
                                  clinic: hospitalController
                                              .clinicDoctorsList[index]
                                              .description ==
                                          null
                                      ? ''
                                      : hospitalController
                                          .clinicDoctorsList[index].description,
                                  daysfrom: 'الاحد',
                                  stars: double.tryParse(hospitalController
                                      .clinicDoctorsList[index].rate_average
                                      .toString()),
                                  daysto: 'الخميس',
                                );
                              },
                            ),
                      // reviews(),

                      (widget.hospital.devices.isNotEmpty)
                          ? Devices(devices: widget.hospital.devices)
                          : EmptyWidget(
                              image: null,
                              title: 'No devices',
                              subTitle: 'No   devices found',
                              titleTextStyle: TextStyle(
                                fontSize: 22,
                                color: Color(0xff9da9c7),
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleTextStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xffabb8d6),
                              ),
                            ),
                      // reviews(),
                      //info(),
                    ],
                  ),
                ),
              )
      ],
    );
  }
}
