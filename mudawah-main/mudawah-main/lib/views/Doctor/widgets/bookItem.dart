import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/models/facibility_models/clinic.dart';
import 'package:mudawah/models/facibility_models/hospital.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/Doctor/widgets/work_time_card.dart';
import 'package:mudawah/views/appointment/appointment.dart';
import '../../../colors.dart';
import '../../../controllers/appointmentController.dart';
import '../../../models/appointment_models/get_work_days_model_body.dart';
import '../../../models/facibility_models/work_day.dart';
import '../../../models/user_models/doctor.dart';
import '../../../others/functions/get_image_from_iternet.dart';
import '../../../others/routes/routes.dart';
import '../../Doctor/DoctorProfile.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class BookCard extends StatelessWidget {
  BookCard({Key? key, required this.clinic, required this.doctor})
      : super(key: key);
  final HospitalJson clinic;
  final Doctorr doctor;
  var workDays;
  // method to delete items without periods
  List<WorkDays> deleteWorkDaysWithoutPeriods(List<WorkDays> workDays) {
    List<WorkDays> workDays1 = [];
    workDays.forEach((element) {
      if (element.periods.length != 0) {
        workDays1.add(element);
        print('periods are : ${element.periods.length}');
      }
    });
    return workDays1;
  }

  @override
  Widget build(BuildContext context) {
    // if (clinic.workDays != null)
    // workDays = deleteWorkDaysWithoutPeriods(clinic.workDays);
    double pagewidth = SizeConfig.screenWidth;
    double pageheight = SizeConfig.screenHeight;
    Map<String, dynamic> argData = {"clinic": clinic, "doctor": doctor};
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.hospital, arguments: {'hospital': clinic});
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: SizeConfig.screenHeight * .22,
        width: SizeConfig.screenWidth * .95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: cardscolor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 4,
              color: Colors.black12,
            ),
          ],
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                clinic.name,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              (clinic.image == null)
                  ? SizedBox(
                      height: SizeConfig.screenHeight * .1,
                      width: SizeConfig.screenWidth * .1,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/splashscreen/user.png"),
                        radius: 17,
                      ),
                    )
                  : SizedBox(
                      height: SizeConfig.screenHeight * .1,
                      width: SizeConfig.screenWidth * .1,
                      child: CircleAvatar(
                        backgroundImage: getImageNetwork(clinic.image),
                        radius: 17,
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * .0,
          ),
          /* workDays != null
              ? Container(
                  height: SizeConfig.screenHeight * .15,
                  width: SizeConfig.screenWidth * .90,
                  child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: workDays.length,
                      itemBuilder: (context, index) {
                        return WorkTimeCard(workDay: workDays[index]);
                      }),
                )
              : Container(),*/
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.appointment, arguments: argData);
                  var controller = Get.find<AppointmentController>();
                  GetWorkDaysBody getWorkDaysBody =
                      GetWorkDaysBody(doctorId: doctor.id, clinicId: clinic.id);
                  controller.getWorkDays(getWorkDaysBody);
                },
                child: Container(
                    alignment: Alignment.bottomCenter,
                    height: SizeConfig.screenHeight * .06,
                    width: SizeConfig.screenWidth * .6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0xff00C9FD),
                          Color(0xff84DFB4),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'احجز الآن',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.screenWidth * .05),
                      ),
                    )),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * .02,
              ),
              InkWell(
                onTap: () {
                  UrlLauncher.launch("tel://${clinic.phoneNumber}");
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
            ]),
          ),
        ]),
      ),
    );
  }
}
