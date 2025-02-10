import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mudawah/controllers/appointmentController.dart';
import 'package:mudawah/views/Schedule/card.dart';

import '../../colors.dart';
import '../../components/show_custom_snackbar.dart';
import '../../models/User.dart';
import '../../models/appointment_models/appointment.dart';
import '../../others/functions/check_internet.dart';
import '../../others/routes/routes.dart';
import '../../others/size_config.dart';
import '../file/bookingcard.dart';

class bookingschedule extends StatefulWidget {
  const bookingschedule({Key? key}) : super(key: key);

  @override
  State<bookingschedule> createState() => _bookingscheduledState();
}

class _bookingscheduledState extends State<bookingschedule> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<AppointmentController>().getDoctorAppointments();
    _refreshData();
    print('hi doctor works init');
    super.initState();
  }

  Future<void> _refreshData() async {
    //if (await checkInternet()) {
    await Get.find<AppointmentController>().getDoctorAppointments();
    // } else {
    //  showCustomSnackBar('يرجى الاتصال بالانترنت ومعاودة المحاولة ');
    //}
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              'اعمالي',
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
              ),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width - 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "الحجوزات",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              LiquidPullToRefresh(
                color: textcolor1.withOpacity(.3),
                showChildOpacityTransition: false,
                animSpeedFactor: 2,
                onRefresh: _refreshData,
                child: Container(
                  height: SizeConfig.screenHeight * .7,
                  width: SizeConfig.screenWidth,
                  child: GetBuilder<AppointmentController>(
                    builder: (controller) => (controller
                            .disDoctorAppointmentList.isEmpty)
                        ? EmptyWidget(
                            packageImage: PackageImage.Image_3,
                            title: 'فارغ!',
                            subTitle: 'لا توجد  حجوزات في قائمة أعمالك',
                            titleTextStyle: TextStyle(
                              fontSize: 22,
                              color: textcolor1,
                              fontWeight: FontWeight.w500,
                            ),
                            subtitleTextStyle: TextStyle(
                              fontSize: 14,
                              color: textcolor1,
                            ),
                          )
                        : ListView.builder(
                            itemCount:
                                controller.disDoctorAppointmentList.length,
                            itemBuilder: (BuildContext context, index) {
                              return BookingDocCard(
                                  controller.disDoctorAppointmentList[index]);
                            },
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container BookingDocCard(Appointment appointment) {
  return Container(
    height: 150,
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        appointment.patientName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                        border: Border.all(
                          color: Color(0xff39a2db),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x330df4d8),
                            blurRadius: 4,
                            offset: Offset(2, 4),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "[${appointment.clinic.name}] حجز لديك موعد في",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 250),
          child: Container(
            height: 50,
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.doctorBookingDetail,
                    arguments: {'appointment': appointment});
              },
              child: Text(
                "انقر للتفاصيل",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          endIndent: 20,
          indent: 20,
        ),
      ],
    ),
  );
}
