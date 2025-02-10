import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:mudawah/controllers/filter_controller.dart';
import 'package:mudawah/controllers/location_controller.dart';
import 'package:mudawah/models/location_model/directorate_model.dart';
import 'package:mudawah/models/user_models/filter_body.dart';
import 'package:mudawah/models/user_models/specializition.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/Home/search.dart';
import 'package:mudawah/views/search/search.dart';
import '../../../colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../others/routes/routes.dart';

TextStyle Btextstyle = TextStyle(color: Color(0xff5e5e5e));
TextStyle Selectedtextstyle = TextStyle(color: Colors.white);
int badgeNo = 0;
int badgeNo1 = 0;
int badgeNo2 = 0;
int badgeNo3 = 0;
int selected1 = 0;
List<String> directoratesButtons = [];
List<Directorate> directorates = [];
List<String> specButtons = [];
List<Specializitions> specs = [];
String selectedSpec = '';
String selectedLoc = '';
String selectedType = '';
final GBController = GroupButtonController(
  selectedIndex: 0,
);
final GBController2 = GroupButtonController(
  selectedIndex: 0,
);
final GBController3 = GroupButtonController(
  selectedIndex: 0,
);

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
//const MyAppBar({Key? key}) : super(key: key);
  bool isback;
  // HomeAppBar(required this.isback) : super();
  HomeAppBar({required this.isback}) : super();
  //bool isback = false;
  // _HomeAppBarState createState() => _HomeAppBarState();
  _HomeAppBarState createState() {
    return _HomeAppBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  void initState() {
    // TODO: implement initState
    if (directoratesButtons.isEmpty) {
      var locationController = Get.find<LocationController>();
      locationController.getDirectorates();
      print('hi filter');
      directoratesButtons.add('الكل');
      directorates = locationController.disDirectoratesList;
      directorates.forEach((element) {
        directoratesButtons.add(element.name);
      });
      var filterController = Get.find<FilterController>();
      filterController.getSpecs();
      specButtons.add('الكل');
      specs = filterController.disSpecssList;
      specs.forEach((element) {
        specButtons.add(element.name);
      });
    }
  }

  _handledoNewFilter() {
    var filterController = Get.find<FilterController>();
    int specId = 0;
    int locId = 0;
    directorates.forEach((element) {
      if (element.name == selectedLoc) {
        {
          locId = element.id;
        }
      }
    });
    if (selectedSpec == 'الكل') {
      specId = -1;
    }

    if (selectedLoc == 'الكل') {
      locId = -1;
    }

    //check type of filter>>>
    if (selectedType == 'طبيب') {
      specs.forEach((element) {
        if (element.name == selectedSpec) {
          specId = element.id;
        }
      });
      if (selectedSpec == 'الكل') {
        specId = -1;
      }

      if (selectedLoc == 'الكل') {
        locId = -1;
        print('location is:$locId ');
      }
      FilterBody filterBody =
          new FilterBody(locationId: locId, SpecId: specId, type: 'd');

      filterController.getDoctorsFilter(filterBody);
    }
    if (selectedType == 'مستشفى') {
      print('hospital filter');

      FilterBody hospitalFilterBody =
          new FilterBody(locationId: locId, type: 'h');
      print(hospitalFilterBody.toJson());
      filterController.getHospitalsFilter(hospitalFilterBody);
    }

    if (selectedType == 'عيادة') {
      FilterBody clinicFilterBody =
          new FilterBody(locationId: locId, type: 'c');
      filterController.getclinicsFilter(clinicFilterBody);
    }
  }

  //   bool isback1   => isback;
//  get isback => isback;bool selectDoctor = true;
  bool selectDoctor = false;
  void _toggle(int i) {
    setState(() {
      i == 1 ? selectDoctor = true : selectDoctor = false;
      //  selectDoctor = !selectDoctor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: primeteilcolor),
      centerTitle: true,
      title: Container(
        padding: EdgeInsets.only(top: 6),
        child: Column(
          children: [
            Text(
              'مُداواة',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
                height: 0.8,
              ),
            ),
            Text(
              'Mudawah Medical App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
      elevation: 0,

      backgroundColor: Colors.white,
      leading: widget.isback
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              iconSize: 25,
              constraints: BoxConstraints.tight(Size(15, 50)),
              color: primeteilcolor,
            )
          : Row(
              children: [
                // IconButton(
                //   onPressed: () {},
                //   constraints: BoxConstraints.tight(Size(35, 50)),
                //   icon: Icon(Icons.mail_rounded),
                //   iconSize: 25,
                //   color: primeteilcolor,
                // ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.notifications_rounded),
                //   iconSize: 25,
                //   constraints: BoxConstraints.tight(Size(15, 50)),
                //   color: primeteilcolor,
                // )
              ],
            ),

      //searchbar
      bottom: searchbar(context),
    );
  }

  PreferredSize searchbar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 62,
          child: TextField(
            readOnly: true,
            textAlign: TextAlign.end,
            onTap: () {
              displayBottomSheet(context, setState);
              // displayBottomSheet(context);
              /*  if (widget.isback == false)
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return HSearch();
                }))*/
            },
            // delegate: ()),
            decoration: InputDecoration(
              hintText: 'فلترة',
              //
              //border design
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: cardscolor,
              //
              //icon design
              prefixIcon: Container(
                margin: EdgeInsets.all(8.6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(550)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xff00C9FD),
                      Color(0xff84DFB4),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
              ),
              suffixIcon: Badge(
                badgeColor: Color(0xff00C9FD),
                position: BadgePosition.topEnd(top: 0, end: -5),
                badgeContent: Text(
                  badgeNo.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: IconButton(
                  onPressed: () {
                    displayBottomSheet(context, setState);
                  },
                  //icon: Icon(Icons.menu),
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void displayBottomSheet(BuildContext context, StateSetter setState1) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return StatefulBuilder(builder: (BuildContext context, setState1) {
            return SafeArea(
              // constraints: const BoxConstraints(maxHeight: 300),
              child: GetBuilder<FilterController>(
                builder: (controller) => (controller.filterLoaded == 1)
                    ? Container(
                        height: 60,
                        width: SizeConfig.screenWidth,
                        color: Colors.white,
                        child: SpinKitWave(
                          color: textcolor1,
                          size: 80.0,
                        ))
                    : Container(
                        // scrollDirection: Axis.vertical,
                        child: Wrap(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /*   TextButton(
                                onPressed: () {
                                  print('hi cance');
                                  Get.back();
                                },
                                child: Text(
                                  "الغاء",
                                  style: TextStyle(fontSize: 15),
                                )),
                        */
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          badgeNo = 0;
                                          badgeNo1 = 0;
                                          badgeNo3 = 0;
                                          badgeNo2 = 0;
                                          selected1 = 0;
                                          //selectDoctor = false;
                                          GBController.selectIndex(0);
                                          GBController2.selectIndex(0);
                                          GBController3.selectIndex(0);
                                        });
                                        setState1(() {
                                          selectDoctor = false;
                                        });
                                      },
                                      child: Text(
                                        "حذف الكل",
                                        style: TextStyle(fontSize: 15),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerEnd,
                              margin: EdgeInsets.only(right: 10),
                              child: Text("الموقع"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: GroupButton(
                                    isRadio: true,
                                    controller: GBController,
                                    options: GroupButtonOptions(
                                      spacing: 9.5,
                                      mainGroupAlignment:
                                          MainGroupAlignment.start,
                                      //groupingType: GroupingType.row,
                                      unselectedBorderColor:
                                          unselectedBorderColor,
                                      selectedColor: selectedColor,
                                      selectedTextStyle: Selectedtextstyle,
                                      selectedBorderColor:
                                          unselectedBorderColor,
                                      unselectedColor: unselectedColor,
                                      groupingType: GroupingType.wrap,
                                      direction: Axis.horizontal,
                                      borderRadius: BorderRadius.circular(30),
                                      buttonHeight: 30,
                                      textAlign: TextAlign.center,
                                      textPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      // buttonWidth: Size.infinite,
                                    ),
                                    // onSelected:  print('Disable Button #$i pressed'),
                                    buttons: directoratesButtons,
                                    onSelected: (val, i, selected) {
                                      selectedLoc = directoratesButtons[i];
                                      //_extendedExampleController.selectedGroupingType = i;
                                      print(
                                          '${directoratesButtons[1]} button is selected');
                                      if (i > 0) {
                                        switch (badgeNo1) {
                                          case 0:
                                            badgeNo1 = 1;
                                            break;
                                          case 1:
                                            badgeNo1 = 2;
                                            break;
                                          case 2:
                                            badgeNo1 = 3;
                                            break;
                                        }
                                      } else if (badgeNo > 0)
                                        badgeNo1 = badgeNo - 1;
                                      setState(() {
                                        // i > 0 ? badgeNo2 = 1 : badgeNo2 = 0;
                                        badgeNo = badgeNo1;
                                        badgeNo2 = badgeNo1;
                                        badgeNo3 = badgeNo1;
                                      });
                                      if (badgeNo > 0) badgeNo1 = badgeNo1 - 1;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerEnd,
                              margin: EdgeInsets.only(right: 10),
                              child: Text("البحث عن"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: GroupButton(
                                    isRadio: true,
                                    controller: GBController3,
                                    options: GroupButtonOptions(
                                      spacing: 9.5,
                                      mainGroupAlignment:
                                          MainGroupAlignment.start,
                                      groupingType: GroupingType.row,
                                      unselectedBorderColor:
                                          unselectedBorderColor,
                                      selectedColor: selectedColor,
                                      unselectedColor: unselectedColor,
                                      selectedTextStyle: Selectedtextstyle,
                                      selectedBorderColor:
                                          unselectedBorderColor,
                                      // groupingType: GroupingType.wrap,
                                      direction: Axis.horizontal,
                                      borderRadius: BorderRadius.circular(30),
                                      buttonHeight: 30,
                                      textAlign: TextAlign.center,
                                      textPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      // buttonWidth: Size.infinite,
                                    ),
                                    // onSelected: (index, isSelected) => print('$index button is selected'),
                                    buttons: ["مستشفى", "طبيب", "عيادة"],
                                    onSelected: (val, i, selected) {
                                      selectedType = val.toString();
                                      print('$selectedType hi othman1');
                                      //_extendedExampleController.selectedGroupingType = i;
                                      //  i == 1 ? selectDoctor = true : selectDoctor = false;
                                      _toggle(i);
                                      print('$i button is selected');
                                      if (i > 0) {
                                        switch (badgeNo3) {
                                          case 0:
                                            badgeNo3 = 1;
                                            break;
                                          case 1:
                                            badgeNo3 = 2;
                                            break;
                                          case 2:
                                            badgeNo3 = 3;
                                            break;
                                        }
                                      } else if (badgeNo > 0)
                                        badgeNo3 = badgeNo - 1;
                                      setState1(() {
                                        // i > 0 ? badgeNo2 = 1 : badgeNo2 = 0;
                                        badgeNo = badgeNo3;
                                        badgeNo1 = badgeNo3;
                                        badgeNo2 = badgeNo3;
                                        //selectDoctor = true;
                                        //  if (i == 1) selectDoctor = true;
                                        // : selectDoctor = false;
                                      });
                                      if (badgeNo > 0) badgeNo3 = badgeNo3 - 1;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            //   if (selectDoctor)
                            Visibility(
                              visible: selectDoctor,
                              // maintainSize: true,
                              // maintainAnimation: true,
                              // maintainState: true,
                              // maintainSemantics: false,
                              // maintainInteractivity: false,
                              // replacement: const SizedBox.shrink(),
                              child: displaySpec(setState1),
                            ),
                            // displaySpec(),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 55,
                                width: 300,
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
                                child: TextButton(
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    _handledoNewFilter();
                                    // _controller.close();
                                  },
                                  child: Text(
                                    'تطبيق التغييرات',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                          color: primeteilcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
              ),
            );
          });
        });
  }

  Widget displaySpec(StateSetter setState1) {
    return Column(
      children: [
        // SizedBox(
        //   height: 20,
        // ),
        Container(
          alignment: AlignmentDirectional.centerEnd,
          margin: EdgeInsets.only(right: 10),
          child: Text("التخصص"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: GroupButton(
                isRadio: true,
                // controller: GroupButtonController(
                //   selectedIndex: selected1,
                //   onDisablePressed: (i) =>
                //       debugPrint('Disable Button #$i pressed'),
                // ),
                controller: GBController2,
                options: GroupButtonOptions(
                  spacing: 9.5,
                  mainGroupAlignment: MainGroupAlignment.start,
                  //groupingType: GroupingType.row,
                  unselectedBorderColor: unselectedBorderColor,
                  selectedColor: selectedColor,
                  selectedTextStyle: Selectedtextstyle,
                  selectedBorderColor: unselectedBorderColor,
                  unselectedColor: unselectedColor,
                  groupingType: GroupingType.wrap,
                  direction: Axis.horizontal,
                  borderRadius: BorderRadius.circular(30),
                  buttonHeight: 30,
                  textAlign: TextAlign.center,
                  textPadding: EdgeInsets.only(left: 10, right: 10),
                  // buttonWidth: Size.infinite,
                ),
                // onSelected: (index, isSelected) => print('$index button is selected'),
                buttons: specButtons,
                onSelected: (val, i, selected) {
                  //_extendedExampleController.selectedGroupingType = i;

                  selectedSpec = val.toString();
                  print('hi othman');
                  print(val);
                  print(i);
                  print(selected);
                  if (i > 0) {
                    switch (badgeNo2) {
                      case 0:
                        badgeNo2 = 1;
                        break;
                      case 1:
                        badgeNo2 = 2;
                        break;
                      case 2:
                        badgeNo2 = 3;
                        break;
                    }
                  } else if (badgeNo > 0) badgeNo2 = badgeNo - 1;
                  setState(() {
                    // i > 0 ? badgeNo2 = 1 : badgeNo2 = 0;
                    badgeNo = badgeNo2;
                    badgeNo1 = badgeNo2;
                    badgeNo3 = badgeNo2;
                  });
                  if (badgeNo > 0) badgeNo2 = badgeNo2 - 1;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
