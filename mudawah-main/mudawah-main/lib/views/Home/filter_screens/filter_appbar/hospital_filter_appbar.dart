import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:mudawah/controllers/filter_controller.dart';
import 'package:mudawah/controllers/hospital_controller.dart';
import 'package:mudawah/controllers/location_controller.dart';
import 'package:mudawah/models/location_model/directorate_model.dart';
import 'package:mudawah/models/user_models/filter_body.dart';
import 'package:mudawah/models/user_models/specializition.dart';
import 'package:mudawah/views/Home/search.dart';
import 'package:mudawah/views/search/search.dart';
import '../../../../colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

TextStyle Btextstyle = TextStyle(color: Color(0xff5e5e5e));
TextStyle Selectedtextstyle = TextStyle(color: Colors.white);

class HospitalFilterAppBar extends StatefulWidget
    implements PreferredSizeWidget {
//const MyAppBar({Key? key}) : super(key: key);
  bool isback;
  // HomeAppBar(required this.isback) : super();
  HospitalFilterAppBar({required this.isback}) : super();
  //bool isback = false;
  // _HomeAppBarState createState() => _HomeAppBarState();
  _AppBarState createState() {
    return _AppBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _AppBarState extends State<HospitalFilterAppBar> {
  TextEditingController mSearchContrller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
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
        child: GetBuilder<HospitalController>(
          builder: (hospitalController) => Container(
            height: 62,
            child: TextField(
              controller: mSearchContrller,
              onChanged: (Value) {
                hospitalController.searchHospitalListItems(Value);
              },
              textAlign: TextAlign.end,
              onTap: () {
                // displayBottomSheet(context);
                if (widget.isback == false)
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return HSearch();
                  }));
              },
              // delegate: ()),
              decoration: InputDecoration(
                hintText: 'بحث',
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
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
