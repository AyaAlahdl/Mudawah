// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';

import '../../../models/doctor_model.dart';
import '../../../models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';
import 'package:share/share.dart';
import 'package:mudawah/controllers/comment_controller.dart';
import 'package:mudawah/controllers/post_controller.dart';
import 'package:mudawah/data/repositories/comment_repository.dart';
import 'package:mudawah/models/post_models/like_body.dart';
import 'package:mudawah/models/response_model.dart';
import 'package:mudawah/others/functions/check_internet.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/utils/app_constants.dart';

import '../../../models/post_models/update_seen_body.dart';
import '../../../others/routes/routes.dart';

class BlogPost extends StatefulWidget {
  const BlogPost({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  _buildLikePost() {
    if (widget.post.userLiked) {
      Get.put(PostsController(postsRepo: Get.find()));
      LikeBody likeBody =
          LikeBody(postId: widget.post.id, likeableType: 'dislike');
      Get.find<PostsController>().likePost(likeBody);
      widget.post.userLiked = false;
      widget.post.likes!.removeLast();
    } else {
      LikeBody likeBody =
          LikeBody(postId: widget.post!.id, likeableType: 'like');
      Get.find<PostsController>().likePost(likeBody);
      Likes like = Likes();
      widget.post.likes!.add(like);
      widget.post.userLiked = true;
    }
    setState(() {});
  }

  _updatePostSeen() {
    UpdateSeenBody post1 = UpdateSeenBody(postId: widget.post.id);
    Get.find<PostsController>().updatePostSeen(post1);
    widget.post.seen = widget.post.seen! + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _updatePostSeen();
        Get.toNamed(Routes.article, arguments: {'post': widget.post});
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
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
                  Spacer(),
                  Text(
                    widget.post.user!.name!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: (widget.post.user!.avatar == null)
                        ? AssetImage(
                            Doctor.profile[0].doctorimg,
                          )
                        : getImageNetwork(widget.post.user!.avatar!)
                            as ImageProvider,
                    radius: 25.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.post.title!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
            ),
            Container(
              //sharelikecom
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Share.share(
                              widget.post.title! +
                                  "                                                                                     " +
                                  widget.post.content!,
                            );
                          },
                          icon: Icon(Icons.share_outlined),
                          color: primeteilcolor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.post.comments!.length.toString()),
                        IconButton(
                          onPressed: () {
                            _updatePostSeen();
                            Get.toNamed(Routes.article,
                                arguments: {'post': widget.post});
                          },
                          icon: Icon(Icons.chat_bubble_outline),
                          color: primeteilcolor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.post.likes!.length.toString()),
                        IconButton(
                          onPressed: () {
                            _buildLikePost();
                          },
                          icon: Icon((widget.post.userLiked)
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined),
                          color: primeteilcolor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              color: textcolor2,
            ),
          ],
        ),
      ),
    );
  }
}
