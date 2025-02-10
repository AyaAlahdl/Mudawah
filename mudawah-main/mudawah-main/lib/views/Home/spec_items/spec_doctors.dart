import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mudawah/controllers/filter_controller.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/Home/components/doctor_card.dart';

import '../widgets/HomeAppbar.dart';
import '../widgets/SideMenu.dart';

class SpcDoctors extends StatelessWidget {
  const SpcDoctors({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeAppBar(
          isback: true,
        ),
        endDrawer: SideMenu(),
        body: GetBuilder<FilterController>(
          builder: (filterController) => SingleChildScrollView(
              child: Column(
            children: [
              ListView.builder(
                  itemCount: filterController.disDoctorsList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(12),
                      child: DoctorCarAll(
                          doctor: filterController.disDoctorsList[index]),
                    );
                  }),
            ],
          )),
        ),
      ),
    );
  }
}
