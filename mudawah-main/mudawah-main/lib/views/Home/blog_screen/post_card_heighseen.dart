import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/controllers/post_controller.dart';
import 'package:mudawah/models/post_models/update_seen_body.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';
import 'package:mudawah/others/size_config.dart';

import '../../../colors.dart';
import '../../../models/Posts.dart';
import '../../../models/post.dart';
import '../../../others/routes/routes.dart';

class PostCardHeighSeen extends StatefulWidget {
  const PostCardHeighSeen({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostCardHeighSeen> createState() => _PostCardHeighSeenState();
}

class _PostCardHeighSeenState extends State<PostCardHeighSeen> {
  _updatePostSeen() {
    UpdateSeenBody post1 = UpdateSeenBody(postId: widget.post.id);
    Get.find<PostsController>().updatePostSeen(post1);
    widget.post.seen = widget.post.seen! + 1;
  }

  @override
  Widget build(BuildContext context) {
    double cardhight = 225;
    double cardwidth = 300;
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.article, arguments: {'post': widget.post});
        _updatePostSeen();
      },
      child: Stack(
        children: [
          Container(
            //layout
            margin: EdgeInsets.all(10),
            height: SizeConfig.screenHeight * .30,
            width: cardwidth,
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
                Column(
                  children: [
                    Container(
                      height: cardhight - 110,
                      width: cardwidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(21),
                            topRight: Radius.circular(21)),
                        image: (widget.post.image == null)
                            ? DecorationImage(
                                image:
                                    AssetImage("assets/ArticleHome/covid.jpg"),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: getImageNetwork(widget.post.image),
                                fit: BoxFit.fill,
                              ),
                        // : DecorationImage(
                        //     image: getImageNetwork(widget.post.image!),
                        //     fit: BoxFit.cover,
                        //   )
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 260,
                      child: Text(
                        // BlogMod.blogs[0].title,
                        widget.post.title!,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.post.user!.name!,
                                // _userModel![index].doctor.toString(),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: textcolor2,
                                ),
                              ),
                              Text(
                                widget.post.createdAt!,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 15,
                                  color: textcolor2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          (widget.post.user!.avatar == null)
                              ? CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/splashscreen/user.png"),
                                  radius: 17,
                                )
                              : CircleAvatar(
                                  backgroundImage: getImageNetwork(
                                      widget.post.user!.avatar!),
                                  radius: 16,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 190,
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.screenWidth * .05,
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
                        widget.post.seen.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
