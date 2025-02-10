import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/others/size_config.dart';
import '../../../colors.dart';
import '../../../models/User.dart';
import '../../../models/user_models/doctor.dart';
import '../../../others/functions/get_image_from_iternet.dart';
import '../../../others/routes/routes.dart';
import '../../Doctor/DoctorProfile.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key, required this.doctor}) : super(key: key);
  final Doctorr doctor;
  @override
  Widget build(BuildContext context) {
    double pagewidth = SizeConfig.screenWidth;
    double pageheight = SizeConfig.screenHeight;
    SizeConfig().init(context);

    return InkWell(
      onTap: () => Get.toNamed(Routes.doctorPf, arguments: {'doctor': doctor}),
      child: Container(
        margin: EdgeInsets.all(8),
        height: SizeConfig.screenHeight * .2,
        width: SizeConfig.screenWidth * .7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: cardscolor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 4,
              color: Colors.black12,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, top: 23),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //star ratings $ payement
                  Padding(
                    padding: const EdgeInsets.only(top: 72, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      //text
                      children: [
                        Text(
                          doctor.name,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 17,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          (!doctor.specializitions.isEmpty)
                              ? doctor.specializitions[0].name
                              : '',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 17,
                            height: 1.2,
                            color: textcolor2,
                          ),
                        ),
                        /*                Text(
                          /*  (doctor.clinics == null)
                              ? 'no hospital'
                              : doctor.clinics![0].name!*/
                          'clinic',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 17,
                            height: 1.2,
                            color: textcolor2,
                          ),
                        ),
           */
                      ],
                    ),
                  ), //end text
                  CircleAvatar(
                    backgroundColor: primeteilcolor,
                    radius: 39,
                    child: CircleAvatar(
                      //  backgroundImage: AssetImage(Doctor.profile[0].doctorimg),
                      backgroundImage: getImageNetwork(doctor.avatar),
                      radius: 38,
                    ),
                  )
                ],
              ),
              Positioned(
                top: 50,
                left: 70,
                child: Row(
                  children: [
                    SmoothStarRating(
                      size: 20,
                      color: primeteilcolor,
                      rating: double.parse(doctor.rate_average.toString()),
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      allowHalfRating: true,

                      //onRatingChanged: ,
                    ),
                    /*            Text(
                      'رسوم الدفع: ... ريال',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 14,
                        color: textcolor2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    */
                  ],
                ),
              ),
              // Positioned(
              //   top: 110,
              //   right: 24,
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text('وقت - وقت'),
              //           Icon(
              //             Icons.access_time,
              //             size: 20,
              //             color: primeteilcolor,
              //           ),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Text('وقت - وقت'),
              //           Icon(
              //             Icons.access_time,
              //             size: 20,
              //             color: primeteilcolor,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
