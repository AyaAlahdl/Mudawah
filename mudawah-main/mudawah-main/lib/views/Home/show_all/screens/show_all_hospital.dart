import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/controllers/hospital_controller.dart';
import 'package:mudawah/models/facibility_models/hospital.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';
import 'package:mudawah/others/routes/routes.dart';
import 'package:mudawah/others/size_config.dart';

import '../../../../colors.dart';
import '../appbars/hospitalAppbar.dart';
import '../../widgets/SideMenu.dart';

class ShowAllHospitals extends StatefulWidget {
  const ShowAllHospitals({Key? key}) : super(key: key);
  _ShowAllHospitalsState createState() => _ShowAllHospitalsState();
}

class _ShowAllHospitalsState extends State<ShowAllHospitals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: HospitalAppBar(
          isback: true,
        ),
        endDrawer: SideMenu(),
        body: SingleChildScrollView(
            child: GetBuilder<HospitalController>(
          builder: (hospitalController) => Container(
              height: SizeConfig.screenHeight * .8,
              width: SizeConfig.screenWidth,
              child: (!hospitalController.disHospitalList.isEmpty)
                  ? ListView.builder(
                      //reverse: true,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: hospitalController.disHospitalList.length,
                      // itemCount: hospitalController.disHospitalList.length,
                      // scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          Hospital(hospitalController.disHospitalList[index]),
                    )
                  : EmptyWidget(
                      title: 'فارغ!',
                      subTitle: 'لا توجد مستشفيات في بحسب البحث المحدد',
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
        )),
      ),
    );
  }

  InkWell Hospital(HospitalJson hospital) {
    double cardsheight = 135;
    double cardswidth = 331;
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.hospital, arguments: {'hospital': hospital});
      },
      //  ),
      child: Center(
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
                                    //  hospital.name,
                                    hospital.name,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: SizeConfig.screenHeight * .02,
                                  // ),
                                  Container(
                                    height: 50,
                                    width: 130,
                                    child: Text(
                                      // hospital.address,
                                      hospital.address,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        height: 1,
                                        fontSize: 15,
                                        color: textcolor2,
                                      ),
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
                          backgroundImage: (hospital.image == null)
                              ? AssetImage('images/pfp.png') as ImageProvider
                              : getImageNetwork(hospital.image),
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
  }
}
