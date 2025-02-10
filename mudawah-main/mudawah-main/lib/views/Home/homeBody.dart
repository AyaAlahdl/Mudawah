// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mudawah/colors.dart';
import 'package:get/get.dart';
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/controllers/appointmentController.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/controllers/filter_controller.dart';
import 'package:mudawah/controllers/hospital_controller.dart';
import 'package:mudawah/data/repositories/hospital_repository.dart';
import 'package:mudawah/views/Home/widgets/Spci.dart';
import 'package:mudawah/views/Home/widgets/clinic_card.dart';
import 'package:mudawah/views/Home/widgets/shimmerList.dart';
import '../../controllers/post_controller.dart';
import '../../controllers/user_controller.dart';
import '../../models/Posts.dart';
import '../../models/post.dart';
import '../../others/functions/check_internet.dart';
import '../../others/routes/routes.dart';
import '../../others/size_config.dart';
import 'blog_screen/post_card.dart';
import 'blog_screen/post_card_heighseen.dart';
import 'widgets/DoctorCard.dart';
import 'widgets/HospitalCard.dart';
import 'widgets/ViralBlogs.dart';
import 'package:flutter/material.dart';
import 'package:mudawah/colors.dart';
import 'package:get/get.dart';
import 'package:mudawah/views/Home/widgets/showAll.dart';
import '../../models/Posts.dart';
import 'widgets/DoctorCard.dart';
import 'widgets/HospitalCard.dart';
import 'widgets/ViralBlogs.dart';
import 'package:mudawah/views/Home/show_all/screens/show_all_hospital.dart';

class homebody extends StatefulWidget {
  const homebody({Key? key}) : super(key: key);

  @override
  State<homebody> createState() => _homebodyState();
}

class _homebodyState extends State<homebody> {
  late List<BlogMod>? _userModel = [];
  var DataBeingfatced = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    Get.find<PostsController>();
    //   // PostsController postsController = Get.find<PostsController>();
    //   _userModel = (await postsController.getPosts());
    Get.find<PostsController>().getPosts();
    //  Get.find<PostsController>().getRecentPosts();
    // Get.find<UserController>().getUsers();
    // Get.find<HospitalController>().getHospitalsData();
    //Get.find<FilterController>().getSpecs();
    Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
          DataBeingfatced = true;
        }));
  }

  Future<void> _refreshHomeData() async {
    // if (await checkInternet()) {
    print('hello internet connect');
    await Get.find<DoctorController>().getDoctors();
    await Get.find<HospitalController>().getHospitalsData();
    await Get.find<HospitalController>().getAllClinicsData();

    await Get.find<PostsController>().getPosts();
    await Get.find<PostsController>().getRecentPosts();
    //   } else {
    //   showCustomSnackBar(
    //     'لست متصلاً بالانترنت، يرجى التأكد من اتصالك بالانترنت واعادة المحاولة');
    print('hello internet not connect');
    // }
  }

  @override
  Widget build(BuildContext context) {
    double pagewidth = MediaQuery.of(context).size.width;
    double pageheight = MediaQuery.of(context).size.height;
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: LiquidPullToRefresh(
          color: textcolor1.withOpacity(.3),
          showChildOpacityTransition: false,
          animSpeedFactor: 2,
          onRefresh: _refreshHomeData,
          child: SingleChildScrollView(
            child: SafeArea(
              child: /* Container(
              color: Colors.blue,
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Center(child: Text('hello othmanasfdl;kjsadflk')),
            )*/
                  SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.showAllDoctorCategory);
                            },
                            child: Text(
                              'عرض الكل',
                              style: TextStyle(
                                color: textcolor2,
                                fontSize: 12,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            'أشهر الاطباء',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: textcolor1,
                              fontSize: 19,
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    GetBuilder<DoctorController>(
                      builder: (controller) => (!controller.doctorsIsLoaded)
                          ? Container(
                              height: pageheight / 5,
                              width: pagewidth,
                              color: Colors.white,
                              child: SpinKitWave(
                                color: textcolor1,
                                size: 80.0,
                              ),
                            )
                          : Container(
                              height: pageheight / 5,
                              child: ListView.builder(
                                reverse: true,
                                itemCount: controller.doctorsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => DoctorCard(
                                    doctor: controller.doctorsList[index]),
                              ),
                            ),
                    ),
                    ////
                    SizedBox(
                      height: 22,
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    ///
                    Container(
                      width: pagewidth / 1.1,
                      height: 58,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          //titles

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ShowAllHospitals(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'عرض الكل',
                                  style: TextStyle(
                                    color: textcolor2,
                                    //  height: 0.3,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                ),
                                child: Text(
                                  'المستشفيات',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: textcolor1,
                                    //height: 0.2,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //end titles
                        ],
                      ),
                    ),
                    GetBuilder<HospitalController>(
                      builder: (hospitalController) => Container(
                        //padding: EdgeInsets.only(bottom: 20),
                        height: SizeConfig.screenHeight * .25,
                        child: ListView.builder(
                          reverse: true,
                          // separatorBuilder:
                          //     (BuildContext context, int index) {
                          //   return SizedBox(
                          //     width: SizeConfig.screenWidth * .05,
                          //   );
                          // },
                          itemCount: hospitalController.hospitalList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => HospitalCard(
                            context,
                            hospitalController.hospitalList[index],
                          ),
                        ),
                      ),
                    ),
                    ////// end hospitals
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                    ///////
                    ///
                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      width: pagewidth / 1.1,
                      height: 50,
                      // padding: EdgeInsets.only(top: 10),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //titles

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.ShowAllClinics);
                                },
                                child: Text(
                                  'عرض الكل',
                                  style: TextStyle(
                                    color: textcolor2,
                                    // height: 0.2,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 17),
                                child: Text(
                                  'العيادات',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: textcolor1,
                                    //height: 0.2,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //end titles
                        ],
                      ),
                    ),
                    GetBuilder<HospitalController>(
                      builder: (hospitalController) => Container(
                        height: pageheight / 4.0,
                        child: ListView.builder(
                          reverse: true,
                          itemCount: hospitalController.clinicList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ClinicCard(
                            context,
                            hospitalController.clinicList[index],
                          ),
                        ),
                      ),
                    ),

                    Divider(
                      height: 3,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight / 2.4,
                      padding: EdgeInsets.only(top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //titles
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(
                                      Routes.ShowAllPostsHeightCategory);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                    'عرض الكل',
                                    style: TextStyle(
                                      color: textcolor2,
                                      height: 0.2,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  'أشهر المقالات',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: textcolor1,
                                    height: 0.2,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          GetBuilder<PostsController>(
                            builder: (postController) => Container(
                                height: SizeConfig.screenHeight * .33,
                                width: SizeConfig.screenWidth,
                                child: (postController.heightPostsIsLoaded != 1)
                                    ? ListView.builder(
                                        reverse: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            postController.postsList.length,
                                        itemBuilder: (context, index) =>
                                            PostCardHeighSeen(
                                                post: postController
                                                    .postsList[index])
                                        //  DoctorCard(doctor: userController.disUsersList[index]),
                                        )
                                    : Center(
                                        child: CircularProgressIndicator(
                                          color: textcolor1,
                                        ),
                                      )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    //////
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.ShowAllPostsNewsCategory);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                    'عرض الكل',
                                    style: TextStyle(
                                      color: textcolor2,
                                      height: 0.2,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  ' آخر المقالات',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: textcolor1,
                                    fontSize: 19,
                                    height: 0.3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GetBuilder<PostsController>(
                            builder: (postController) => Container(
                                height: pageheight / 2,
                                child: (postController.isLoaded)
                                    ? ListView.builder(
                                        itemCount: postController
                                            .recentPostsList.length,
                                        itemBuilder: (context, index) =>
                                            PostCard(
                                                post: postController
                                                    .recentPostsList[index]),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(
                                          color: textcolor1,
                                        ),
                                      )),
                          ),
                        ],
                      ),
                    ),

                    ///
                  ])),
            ),
          ),
        ));
  }

//}

}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types

//@override
// void initState() {
//   super.initState();
// }

// @override
// Widget build(BuildContext context) {
//   double pagewidth = MediaQuery.of(context).size.width;
//   double pageheight = MediaQuery.of(context).size.height;

//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         Container(
//           width: pagewidth / 1.1,
//           height: 63,
//           padding: EdgeInsets.only(top: 13),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               //titles
//               Text(
//                 'أشهر الاطباء',
//                 textAlign: TextAlign.right,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   color: textcolor1,
//                   fontSize: 19,
//                   height: 0.1,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const ShowAll(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'عرض الكل',
//                       style: TextStyle(
//                         color: textcolor2,
//                         fontSize: 12,
//                         height: 0.2,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'أشهر الاطباء تقييما',
//                     style: TextStyle(
//                       color: textcolor2,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//               //end titles
//             ],
//           ),
//         ),
//         ////
//         ///
//         GetBuilder<UserController>(
//           builder: (userController) => Container(
//             height: pageheight / 3.5,
//             child: ListView.builder(
//               reverse: true,
//               itemCount: userController.disDoctorsList.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) =>
//                   DoctorCard(doctor: userController.disDoctorsList[index]),
//             ),
//           ),
//         ),
//         ////
//         Container(
//           width: pagewidth / 1.1,
//           height: 58,
//           padding: EdgeInsets.only(top: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               //titles

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'عرض الكل',
//                       style: TextStyle(
//                         color: textcolor2,
//                         height: 0.2,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'التخصصات',
//                     textAlign: TextAlign.right,
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       color: textcolor1,
//                       height: 0.2,
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               //end titles
//             ],
//           ),
//         ),
//         GetBuilder<HospitalController>(
//           builder: (hospitalController) => Container(
//             height: pageheight / 3.5,
//             child: ListView.builder(
//               reverse: true,
//               itemCount: hospitalController.disHospitalList.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) => HospitalCard(
//                   context, hospitalController.disHospitalList[index]),
//             ),
//           ),
//         ),

//         ///
//         Container(
//           width: pagewidth / 1.1,
//           height: 74,
//           padding: EdgeInsets.only(top: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               //titles
//               Text(
//                 'أشهر المقالات',
//                 textAlign: TextAlign.right,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   color: textcolor1,
//                   fontSize: 19,
//                   height: 0.3,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'عرض الكل',
//                       style: TextStyle(
//                         color: textcolor2,
//                         fontSize: 12,
//                         height: 0.3,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'أشهر المقالات زيارة',
//                     style: TextStyle(
//                       color: textcolor2,
//                       height: 0.3,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//               //end titles
//             ],
//           ),
//         ),
//         //////////
//         // GetBuilder<PostsController>(
//         //   builder: (controller) => Container(
//         //     width: pagewidth / 1.1,
//         //     height: pageheight / 1.7,
//         //     child: ListView.builder(
//         //       reverse: true,
//         //       itemCount: controller.postsList.length,
//         //       itemBuilder: (context, index) =>
//         //           PostCard(post: postController.postsList[index]),
//         //     ),
//         //   ),
//         // ),
//       ],
//     ),
//   );
// }