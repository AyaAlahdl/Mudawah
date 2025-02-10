import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/controllers/post_controller.dart';
import 'package:mudawah/models/post.dart';
import 'package:mudawah/views/blogs/AddBlog.dart';
import 'package:image_picker/image_picker.dart';

import '../../others/size_config.dart';
import 'components/blogAppBar.dart';

class MyBlog extends StatefulWidget {
  const MyBlog({Key? key}) : super(key: key);
  _MyBlogState createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlog> {
  XFile? image;
  File? _imageFile;
  String? base64Image;
  TextEditingController mTitleController = TextEditingController();
  TextEditingController mContentController = TextEditingController();
  //File _image;
  final picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
      if (img != null) {
        setState(() {
          //_imageFile = pickedFile as PickedFile;
          _imageFile = File(img.path);
          //   XFile fileSent = _imageFile as XFile;
          //  Get.find<AuthRepo>().uploadImage(fileSent);
          // _uploadImage();
          final bytes = File(_imageFile!.path).readAsBytesSync();
          base64Image = "${base64Encode(bytes)}";
          print("img_pan : $base64Image");
        });
      } else {
        print('no image yet');
      }
    });
  }

  _sendPost() {
    Post post = new Post(
        title: mTitleController.text,
        content: mContentController.text,
        image: base64Image,
        categoryId: 2);
    Get.find<PostsController>().sendPost(post);
    log('hi');
  }

  @override
  Widget build(BuildContext context) {
    false;
    return SingleChildScrollView(
        child: Material(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: BlogSliverAppBar(
                    expandedHeight: 200.0,
                    imagePath: '',
                    title: 'اضافة صورة',
                    onPressed: () => displayBottomSheet(context),
                    image: image),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 5,
                  ),
                  AddBlog(
                      mTitleController: mTitleController,
                      mContentController: mContentController,
                      onPressed: () {
                        _sendPost();

                        print('hello blog');
                      }),
                ]),
              )
            ],
          ),
          Positioned(
            top: SizeConfig.screenHeight * .1,
            left: 0,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.back_hand)),
          ),
        ],
      ),
    ));
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.camera_alt_outlined),
                    title: Text('الكاميرا'),
                    onTap: () {
                      // _getImage(ImageSource.camera, context);
                      getImage(ImageSource.camera);
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_album_outlined),
                    title: Text('المعرض'),
                    onTap: () {
                      // _getImage(ImageSource.gallery, context);
                      getImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
