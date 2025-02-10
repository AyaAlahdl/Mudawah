import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/views/Home/show_all/appbars/doctorAppar.dart';
//import '../components/doctor_card.dart';

import 'package:mudawah/views/Home/widgets/DoctorCard.dart';
import 'package:mudawah/views/Home/widgets/search_appbar.dart';
import '../../../../colors.dart';
import '../../widgets/HomeAppbar.dart';
import '../../widgets/SideMenu.dart';

class ShowAllDoctorCategory extends StatelessWidget {
  const ShowAllDoctorCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DoctorAppBar(
        isback: true,
      ),
      endDrawer: SideMenu(),
      body: GetBuilder<DoctorController>(
          builder: (controller) => (!controller.disDoctorsList.isEmpty)
              ? ListView.builder(
                  itemCount: controller.disDoctorsList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(12),
                      child:
                          DoctorCard(doctor: controller.disDoctorsList[index]),
                    );
                  })
              : EmptyWidget(
                  title: 'فارغ!',
                  subTitle: 'لا يوجد أطباء  بحسب البحث المحدد',
                  titleTextStyle: TextStyle(
                    fontSize: 22,
                    color: textcolor1,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitleTextStyle: TextStyle(
                    fontSize: 14,
                    color: textcolor1,
                  ),
                )),
    );
  }
}
