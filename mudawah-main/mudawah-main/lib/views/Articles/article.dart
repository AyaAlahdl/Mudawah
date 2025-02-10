// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'dart:developer';

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

import '../../controllers/doctor_controller.dart';
import '../../data/repositories/doctor_repository.dart';
import '../../models/post.dart';
import '../../models/posts.dart';
import 'package:timeago/timeago.dart' as timeago;

class Article extends StatefulWidget {
  Article({Key? key}) : super(key: key);
  static const routeName = '/Article';

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  var argumentData = Get.arguments;

  Post? post;

  TextEditingController mAddCommentController = TextEditingController();
  _handleAddCommentCallBack(ResponseModel responseModel, Comment comment) {
    if (responseModel.isSuccess) {
      if (responseModel.message == 'added successfully') {
        comment.user = AppCostants.user;
        post!.comments!.add(comment);
        mAddCommentController.text = '';
        setState(() {});
      }
    }
  }

  _addnewComment() async {
    if (mAddCommentController.text != '') {
      if (await checkInternet()) {
        Get.put(CommentRepo(apiClient: Get.find()));
        Get.put(CommentController(commentRepo: Get.find()));
        Comment comment = Comment(
            content: mAddCommentController.text,
            userId: AppCostants.user.id,
            postId: post!.id);
        ResponseModel responseModel =
            await Get.find<CommentController>().addNewComment(comment);
        //post!.comments!.add(comment);
        _handleAddCommentCallBack(responseModel, comment);
        _refreshDataInPreviusSrcreen();
        setState(() {});
      } else {
        showCustomSnackBar('أنت لست متصل بالانترنت في الوقت الحالي');
      }
    } else {
      showCustomSnackBar('المعذرة، يرجى كتاب تعليقك أولاً ');
    }
  }

  _buildLikePost() {
    if (post!.userLiked) {
      Get.put(PostsController(postsRepo: Get.find()));
      LikeBody likeBody = LikeBody(postId: post!.id, likeableType: 'dislike');
      Get.find<PostsController>().likePost(likeBody);
      post!.userLiked = false;
      post!.likes!.removeLast();
    } else {
      LikeBody likeBody = LikeBody(postId: post!.id, likeableType: 'like');
      Get.find<PostsController>().likePost(likeBody);
      Likes like = Likes();
      post!.likes!.add(like);
      post!.userLiked = true;
    }
    _refreshDataInPreviusSrcreen();
    setState(() {});
  }

  _refreshDataInPreviusSrcreen() {
    Get.put(DoctorRepo(apiClient: Get.find()));
    Get.put(DoctorController(doctorRepo: Get.find()));
    Get.find<DoctorController>().getDoctorPosts(post!.user!.id!);
  }

  @override
  Widget build(BuildContext context) {
    //final artc = ModalRoute.of(context)!.settings.arguments as BlogMod?;
    post = argumentData['post'];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              toolbarHeight: 60,
              pinned: false,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(45),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Share.share(post!.title! +
                                    "                                                                                     " +
                                    post!.content! +
                                    '                                              ' +
                                    'تطبيق مُداواه');
                              },
                              icon: Icon(Icons.share_outlined),
                              color: primeteilcolor,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(post!.comments!.length.toString()),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chat_bubble_outline),
                              color: primeteilcolor,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(post!.likes!.length.toString()),
                            IconButton(
                              onPressed: () {
                                _buildLikePost();
                              },
                              icon: Icon((post!.userLiked)
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
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                  background: (post!.image != null)
                      ? Image.network(
                          AppCostants.GET_IMAGE_URL + post!.image!,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        )
                      : Image.asset("assets/splashscreen/user.png"))),
          SliverToBoxAdapter(
            child: artcBody(),
          ),
        ],
      ),
    );
  }

  Widget artcBody() {
    int s = 0;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Text(
            post!.title!,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              height: 1.5,
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            post!.content!,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
          Divider(
            indent: 30,
            endIndent: 30,
            color: textcolor2,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: SizeConfig.screenHeight * .2,
                child: TextField(
                  maxLines: 3,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(71),
                  ],
                  onChanged: (v) {
                    if (v.length == 70 && s == 0) {
                      showCustomSnackBar('لا يمكنك اضافة تعليق أكبر من هذا ');
                      s = 1;
                    }
                  },
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                  controller: mAddCommentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primeteilcolor,
                      ),
                    ),
                    prefixIcon: TextButton(
                      onPressed: () {
                        _addnewComment();
                      },
                      child: Container(
                        margin: EdgeInsets.all(9),
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
                          Icons.arrow_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(post!.comments!.length.toString()),
              ],
            ),
          ),
          if (post!.comments.length > 0)
            for (var i = 0; i < post!.comments.length; i++)
              CommentCard(post!.comments[i]),

          // CommentCard(post!.comments![1]),
          // CommentCard(post!.comments![2]),
          // CommentCard(post!.comments![3]),
          //  ListView.builder(
          //   itemCount: 3,
          //    scrollDirection: Axis.horizontal,
          //    itemBuilder: ((context, index) {
          //print('length is: ${post!.comments!.length}');
          //      return Text('hello');
          //    })),
          //   Column(
          //     children: [
          //       UserProfileCard(),
          //       Divider(
          //         indent: 30,
          //         endIndent: 30,
          //         color: textcolor2,
          //       ),
          //       UserProfileCard(),
          //       Divider(
          //         indent: 30,
          //         endIndent: 30,
          //         color: textcolor2,
          //       ),
          //       UserProfileCard(),
          //       Divider(
          //         indent: 30,
          //         endIndent: 30,
          //         color: textcolor2,
          //       ),
          //     ],
          //   ),
          // ],
        ]),
      ),
    );
  }

  Container CommentCard(Comment comment) {
    return Container(
      padding: EdgeInsets.only(left: 0, top: 20, right: 15),
      height: SizeConfig.screenHeight * .2,
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                comment.user!.name!,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * .02,
              ),
              CircleAvatar(
                radius: 22,
                backgroundColor: primeteilcolor,
                child: (comment.user!.avatar == null)
                    ? CircleAvatar(
                        backgroundImage: AssetImage(BlogMod.blogs[0].doctorimg),
                        radius: 20,
                      )
                    : CircleAvatar(
                        backgroundImage: getImageNetwork(comment.user!.avatar!),
                        radius: 20,
                      ),
              ),
            ],
          ),
          SizedBox(
            width: SizeConfig.screenWidth,
            child: Text(
              comment.content!,
              style: TextStyle(color: Colors.black54, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          /*     IconButton(
            padding: EdgeInsets.only(top: 70, left: 70),
            onPressed: () {},
            icon: Icon(Icons.thumb_up_alt_outlined),
            color: primeteilcolor,
            iconSize: 15,
          )
     */
          Container(
            color: Colors.grey,
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * .0008,
          )
        ],
      ),
    );
  }
}
