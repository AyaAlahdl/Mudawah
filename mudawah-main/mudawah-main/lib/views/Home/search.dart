// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mudawah/views/Home/homeBody.dart';
//import 'package:mudawah/views/Home/widgets/test.dart';

import 'widgets/HomeAppbar.dart';
import 'widgets/SideMenu.dart';

class HSearch extends StatefulWidget {
  const HSearch({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<HSearch> createState() => _SearchState();
}

class _SearchState extends State<HSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeAppBar(
          isback: true,
        ),
        endDrawer: SideMenu(),
        body: Container(),
      ),
    );
  }
}
