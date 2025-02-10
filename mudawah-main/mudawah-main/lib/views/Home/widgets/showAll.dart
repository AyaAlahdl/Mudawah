import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/views/Home/components/doctor_card.dart' as doctorCard;
import 'DoctorCard.dart';
import 'HomeAppbar.dart';
import 'SideMenu.dart';

class ShowAll extends StatelessWidget {
  const ShowAll({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeAppBar(
          isback: true,
        ),
        endDrawer: SideMenu(),
        body: SingleChildScrollView(
            child: Column(
          // margin: EdgeInsets.all(12),
          // height: MediaQuery.of(context).size.height,
          children: [
            GetBuilder<UserController>(
              builder: (userController) => ListView.builder(
                  itemCount: userController.disDoctorsList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(12),
                      child: DoctorCard(
                          doctor: userController.disDoctorsList[index]),
                    );
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
