// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/models/user_models/doctor.dart';
import 'package:mudawah/views/Doctor/widgets/BlogPost.dart';
import 'package:mudawah/views/Doctor/widgets/DocInformation.dart';
import 'package:mudawah/views/Doctor/widgets/DocReview.dart';
//import 'package:mudawah/views/Doctor_bookings/components/bookItem.dart';

import 'bookItem.dart';

class tabbarselect extends StatefulWidget {
  const tabbarselect({Key? key, required this.doctor}) : super(key: key);
  final Doctorr doctor;

  @override
  State<tabbarselect> createState() => _tabbarselectState();
}

class _tabbarselectState extends State<tabbarselect>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SingleChildScrollView(
      child: Column(
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
              tabs: [
                Tab(text: 'المراجعات'),
                Tab(text: 'المدونة'),
                Tab(text: 'الدوام'),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 600,
            child: GetBuilder<DoctorController>(
              builder: (doctorController) => GetBuilder<DoctorController>(
                builder: (doctorController) => TabBarView(
                  controller: _tabController,
                  children: [
                    reviews(doctor: widget.doctor),
                    (doctorController.disDoctorPosts.isEmpty)
                        ? EmptyWidget(
                            image: null,
                            title: 'فارغ!',
                            subTitle: 'لا توجد أي منشورات لهذا الدكتور',
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
                            itemCount: doctorController.disDoctorPosts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BlogPost(
                                  post: doctorController.disDoctorPosts[index]);
                            },
                          ),
                    (doctorController.doctorClinicsList.isEmpty)
                        ? EmptyWidget(
                            image: null,
                            title: 'فارغ',
                            subTitle: 'لا توجد عيادات مضافة حالياً ',
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
                                doctorController.doctorClinicsList.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(12),
                                child: BookCard(
                                  clinic:
                                      doctorController.doctorClinicsList[index],
                                  doctor: widget.doctor,
                                ),
                              );
                            }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
