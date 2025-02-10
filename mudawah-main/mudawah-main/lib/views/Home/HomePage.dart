// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mudawah/views/Home/homeBody.dart';

import 'widgets/HomeAppbar.dart';
import 'widgets/SideMenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
         appBar: HomeAppBar(
          isback: false,
        ),
        endDrawer: SideMenu(),
        body: homebody(),
      ),
    );
  }
}
