import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/controllers/post_controller.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/views/Home/show_all/appbars/posts_news_appbar.dart';
//import '../components/doctor_card.dart';

import 'package:mudawah/views/Home/widgets/DoctorCard.dart';
import 'package:mudawah/views/Home/widgets/search_appbar.dart';
import '../../blog_screen/post_card.dart';
import '../../blog_screen/post_card_heighseen.dart';
import '../../widgets/HomeAppbar.dart';
import '../../widgets/SideMenu.dart';

class ShowAllPostsNewsCategory extends StatelessWidget {
  const ShowAllPostsNewsCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PostNewsAppBar(
        isback: true,
      ),
      endDrawer: SideMenu(),
      body: GetBuilder<PostsController>(
        builder: (controller) => ListView.builder(
            itemCount: controller.disRecentPostsList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(12),
                child: PostCard(post: controller.disRecentPostsList[index]),
              );
            }),
      ),
    );
  }
}
