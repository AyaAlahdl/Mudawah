import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mudawah/controllers/doctor_controller.dart';

import '../../../colors.dart';
import '../search.dart';

class SearchText extends StatelessWidget implements PreferredSizeWidget {
  SearchText({Key? key, required this.isback}) : super(key: key);
  final bool isback;
  TextEditingController mSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      leading: isback
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
            controller: mSearchController,
            onChanged: (val) {
              //   Get.find<DoctorController>()
            },
            textAlign: TextAlign.end,
            onTap: () {
              // displayBottomSheet(context);
              if (isback == false)
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

              //icon: Icon(Icons.menu),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(120);
}
