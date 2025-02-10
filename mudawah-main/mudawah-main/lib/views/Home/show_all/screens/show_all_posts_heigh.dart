import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/controllers/post_controller.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/Home/show_all/appbars/posts_height_appbar.dart';
//import '../components/doctor_card.dart';

import 'package:mudawah/views/Home/widgets/DoctorCard.dart';
import 'package:mudawah/views/Home/widgets/search_appbar.dart';
import '../../blog_screen/post_card_heighseen.dart';
import '../../widgets/HomeAppbar.dart';
import '../../widgets/SideMenu.dart';

class ShowAllPostsHeightCategory extends StatelessWidget {
  const ShowAllPostsHeightCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PostHeightAppBar(
        isback: true,
      ),
      endDrawer: SideMenu(),
      body: GetBuilder<PostsController>(
          builder: (controller) => Container(
                margin: EdgeInsets.only(left: SizeConfig.screenHeight * .03),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * .9,
                child: ListView.builder(
                    itemCount: controller.dispostsList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(12),
                        child: PostCardHeighSeen(
                            post: controller.dispostsList[index]),
                      );
                    }),
              )),
    );
  }
}
