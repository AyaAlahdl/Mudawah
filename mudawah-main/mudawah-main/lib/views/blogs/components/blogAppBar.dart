// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BlogSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String imagePath;
  final String title;
  final VoidCallback onPressed;
  XFile? image;

  BlogSliverAppBar({
    required this.expandedHeight,
    required this.imagePath,
    required this.title,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: <Widget>[
        image == null
            ? element(context, shrinkOffset)
            : myImage(context, shrinkOffset)
        // if (image != null)
        //   Container(
        //     decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //         bottomRight: Radius.circular(10),
        //         bottomLeft: Radius.circular(10),
        //       ),
        //     ),
        //     height: 200,
        //     width: double.infinity,
        //     child: Image.file(
        //       //to show image, you type like this.
        //       File(image!.path),
        //       fit: BoxFit.cover,
        //       width: MediaQuery.of(context).size.width,
        //       height: 190,
        //     ),
        //   ),
        // if (photo != null)
        //   Image.asset(
        //     photo.path,
        //     fit: BoxFit.contain,
        //   ),
      ],
    );
  }

  Widget myImage(context, double shrinkOffset) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: SizedBox.fromSize(
                size: Size.fromRadius(10),
                child: Image.file(
                  //to show image, you type like thids.
                  File(image!.path),
                 // image!.path,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                ),
              ),

              // child: Image.network(
              //   //to show image, you type like this.
              //   //File(image!.path),
              //   image!.path,
              //   fit: BoxFit.cover,
              //   width: MediaQuery.of(context).size.width,
              //   height: 190,
              // ),
            )),
        Center(
          child: Opacity(
              opacity: shrinkOffset / expandedHeight,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: expandedHeight,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color(0xff00C9FD),
                      Color(0xff84DFB4),
                    ],
                  ),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: Text(
                    'اضافة مقال',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                ),
              )),
        ),
        Center(
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: TextButton.icon(
              onPressed: () {
                //displayBottomSheet(context);
                onPressed();
              },
              label: Text(
                image == null ? title : 'تغيير الصورة',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget element(context, double shrinkOffset) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Color(0xff00C9FD),
                Color(0xff84DFB4),
              ],
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                color: Colors.white,
              ),
              label: Text(
                'اضافة مقال',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: TextButton.icon(
              onPressed: () {
                //displayBottomSheet(context);
                onPressed();
              },
              label: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

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
                    title: Text('Camera'),
                    onTap: () {
                      // _obtenerImagen(ImageSource.camera);
                      onPressed();
                      print("object");
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_album_outlined),
                    title: Text('Gallery'),
                    onTap: () {
                      onPressed();
                      print("object");
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
