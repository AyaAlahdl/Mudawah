import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/others/size_config.dart';

import '../../../colors.dart';
import '../../../controllers/post_controller.dart';
import '../../../models/Posts.dart';
import '../../../models/post.dart';
import '../../../models/post_models/update_seen_body.dart';
import '../../../others/functions/get_image_from_iternet.dart';
import '../../../others/routes/routes.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final Post post;
  _updatePostSeen() {
    UpdateSeenBody post1 = UpdateSeenBody(postId: post.id);
    Get.find<PostsController>().updatePostSeen(post1);
    post.seen = post.seen + 1;
  }

  @override
  Widget build(BuildContext context) {
    double cardsheight = 120;
    double cardswidth = 350;
    return Center(
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.article, arguments: {'post': post});
          _updatePostSeen();
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
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
              child: Stack(
                children: [
                  Positioned(
                    left: 245,
                    child: Container(
                      width: cardswidth / 3.3,
                      height: cardsheight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          image: (post.image == null)
                              ? DecorationImage(
                                  image: AssetImage(
                                      "assets/splashscreen/user.png"),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: getImageNetwork(post.image),
                                  fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 170,
                          height: 43,
                          child: Text(
                            post.title,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              //height: 1.2,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    post.user.name,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: textcolor2,
                                    ),
                                  ),
                                  Text(
                                    post.createdAt,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 13,
                                      color: textcolor2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            (post.user.avatar == null)
                                ? CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                      BlogMod.blogs[1].doctorimg,
                                    ),
                                    radius: 16,
                                  )
                                : CircleAvatar(
                                    backgroundImage: getImageNetwork(
                                      post.user.avatar,
                                    ),
                                    radius: 16,
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: SizeConfig.screenHeight * .03,
                    left: SizeConfig.screenWidth * .1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.05,
                        ),
                        Icon(
                          Icons.visibility,
                          size: 14,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * .005,
                        ),
                        Text(
                          post.seen.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
