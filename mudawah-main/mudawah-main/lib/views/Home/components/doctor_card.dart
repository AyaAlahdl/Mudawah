import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/models/user_models/doctor.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';
import 'package:mudawah/others/size_config.dart';
import '../../../colors.dart';
import '../../../others/routes/routes.dart';

class DoctorCarAll extends StatelessWidget {
  const DoctorCarAll({Key? key, required this.doctor}) : super(key: key);
  final Doctorr doctor;
  @override
  Widget build(BuildContext context) {
    double cardsheight = 131;
    double cardswidth = 331;
    return Center(
      child: InkWell(
        onTap: () =>
            Get.toNamed(Routes.doctorPf, arguments: {'doctor': doctor}),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: cardsheight,
              width: cardswidth,
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
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.screenHeight * .04,
                                  ),
                                  Text(
                                    '${doctor.name}',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * .02,
                                  ),
                                  Text(
                                    (!doctor.specializitions.isEmpty)
                                        ? doctor.specializitions[0].name
                                        : '',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: SizeConfig.screenWidth * .05,
                                      color: textcolor2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundImage: (doctor.avatar == null)
                              ? AssetImage('images/pfp.png') as ImageProvider
                              : getImageNetwork(doctor.avatar),
                          radius: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
