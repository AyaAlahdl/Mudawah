import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mudawah/controllers/filter_controller.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/Home/components/doctor_card.dart';

import '../widgets/HomeAppbar.dart';
import '../widgets/SideMenu.dart';

class FilterDoctorCategory extends StatelessWidget {
  const FilterDoctorCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(
        isback: true,
      ),
      endDrawer: SideMenu(),
      body: SingleChildScrollView(
        child: GetBuilder<FilterController>(
          builder: (filterController) => Container(
            height: SizeConfig.screenHeight * .8,
            width: SizeConfig.screenWidth,
            child: ListView.builder(
                itemCount: filterController.disDoctorsList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DoctorCarAll(
                      doctor: filterController.disDoctorsList[index]);
                }),
          ),
        ),
      ),
    );
  }
}
