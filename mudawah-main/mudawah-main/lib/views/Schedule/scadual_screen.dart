import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mudawah/others/size_config.dart';

import '../../controllers/appointmentController.dart';
import 'card.dart';

class ScadualScreen extends StatelessWidget {
  const ScadualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 5,
      width: SizeConfig.screenWidth,
      child: GetBuilder<AppointmentController>(
        builder: (controller) => Container(
          child: ListView.builder(
              itemCount: controller.disDoctorAppointmentList.length,
              itemBuilder: (BuildContext context, index) {
                return card(
                  appointment: controller.disDoctorAppointmentList[index],
                );
              }),
        ),
      ),
    );
  }
}
