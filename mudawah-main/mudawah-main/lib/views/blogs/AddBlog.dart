import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import 'package:flutter/material.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/others/functions/check_internet.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/Doctor/DoctorProfile.dart';

import '../../controllers/post_controller.dart';
import '../../models/post.dart';
import '../../models/response_model.dart';
import '../../others/size_config.dart';

class AddBlog extends StatefulWidget {
  const AddBlog(
      {Key? key,
      required this.mTitleController,
      required this.mContentController,
      required this.onPressed,
      this.image})
      : super(key: key);
  final TextEditingController mTitleController;
  final TextEditingController mContentController;
  final Function? onPressed;
  final String? image;

  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  _sendPost() async {
    if (await checkInternet()) {
      var controller = Get.find<PostsController>();

      Post post = new Post(
          title: widget.mTitleController.text,
          content: widget.mContentController.text,
          image: (widget.image != null) ? widget.image! : null,
          categoryId: 1);
      ResponseModel responseModel = await controller.sendPost(post);
      if (responseModel.isSuccess) {
        _handleDefaultValues();

        Get.find<PostsController>().getRecentPosts();
        showCustomSnackBar('تمت اضافة مقالتك بنجاح👏');
      } else {
        showCustomSnackBar('حدث خطأ ما ، لم يتم إضافة منشورك بعد');
      }

      //log('hi');
    } else {
      showCustomSnackBar(
          'لست متصلاً بالانترنت ، يرجى الاتصال بالانترنت وإعادة المحاولة');
    }
  }

  _handleDefaultValues() {
    widget.mTitleController.clear();
    widget.mContentController.clear();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostsController>(
      builder: (controller) => (controller.sendPostLoaded == 1)
          ? Container(
              height: SizeConfig.screenHeight * .2,
              width: SizeConfig.screenWidth * .2,
              color: Color(0xFFFFFFFF),
              child: SpinKitCubeGrid(
                color: textcolor1,
                size: 80.0,
              ),
            )
          : Stack(
              children: [
                Container(
                  //height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      /*         Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      "الاهتمامات",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: Colors.tealAccent,
                          size: 25,
                        )),
                  ],
                ),
              */
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /*       Directionality(
                      textDirection: TextDirection.rtl,
                      child: GroupButton(
                        isRadio: false,
                        controller: GroupButtonController(
                          selectedIndex: 0,
                          onDisablePressed: (i) =>
                              debugPrint('Disable Button #$i pressed'),
                        ),
                        options: GroupButtonOptions(
                          spacing: 9.5,
                          mainGroupAlignment: MainGroupAlignment.start,
                          //groupingType: GroupingType.row,
                          unselectedBorderColor: Colors.tealAccent,
                          selectedColor: Color(0xca00cbfd),
                          selectedTextStyle: TextStyle(color: Colors.black),
                          selectedBorderColor: Colors.tealAccent,
                          groupingType: GroupingType.wrap,
                          direction: Axis.horizontal,
                          borderRadius: BorderRadius.circular(30),
                          buttonHeight: 30,
                          textAlign: TextAlign.center,
                          textPadding: EdgeInsets.only(left: 10, right: 10),
                          // buttonWidth: Size.infinite,
                        ),
                        // onSelected: (index, isSelected) => print('$index button is selected'),
                        buttons: [
                          "القلب",
                          "الصحة والجمال",
                          "اطفال",
                          "السمنة",
                          "الحياة الزوجية",
                          "السكري",
                          "تسوس الاسنان",
                          "السكري",
                          "اخرى",
                          "نصائح غذائية"
                        ],
                        onSelected: (val, i, selected) {
                          //_extendedExampleController.selectedGroupingType = i;
                        },
                      ),
                    ),
               */
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            // height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                //  QuillToolbar.basic(controller: _controller),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                      child: TextField(
                                    controller: widget.mTitleController,
                                    obscureText: false,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'العنوان',
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: TextFormField(
                                          controller: widget.mContentController,
                                          obscureText: false,
                                          //expands: true,
                                          minLines: 8,
                                          textAlign: TextAlign.right,
                                          textInputAction:
                                              TextInputAction.newline,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              //labelText: 'محتوى المقال',
                                              hintText: 'محتوى المقال .....',
                                              hintMaxLines: 1),
                                        ))),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
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
                                        //   widget.onPressed;
                                        print('hi post');
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        _sendPost();
                                      },
                                      child: Text(
                                        ' نشر المقال',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: BorderSide(
                                              color: primeteilcolor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // TextChipField(
                                //   initialString: ctrl.purchaseNumbers,
                                //   seprator: " ",
                                //   decoration: InputDecoration(
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(30),
                                //     ),
                                //   ),
                                //   onChanged: (val) {
                                //     print(val); //"changed string"
                                //   },
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
