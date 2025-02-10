import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:mudawah/views/account/components/button.dart';

class AccountSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String imagePath;
  final String title;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  AccountSliverAppBar(
      {required this.expandedHeight,
      required this.imagePath,
      required this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
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
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 4 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SizedBox(
                    height: expandedHeight - 20,
                    width: MediaQuery.of(context).size.width / 2,
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundColor: Colors.white,
                      backgroundImage: _imageFile == null
                          ? AssetImage("assets/splashscreen/user.png")
                          : FileImage(File(_imageFile!.path)) as ImageProvider,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 4 - shrinkOffset + 110,
          right: MediaQuery.of(context).size.width / 8,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: SizedBox(
                    height: expandedHeight - 80,
                    width: MediaQuery.of(context).size.width / 5,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => Button()),
                        );
                      },
                      child: Icon(
                        CupertinoIcons.camera,
                        color: Colors.cyan,
                        size: 28.0,
                      ),
                    ),
                  ),
                ),
              ],
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
}
