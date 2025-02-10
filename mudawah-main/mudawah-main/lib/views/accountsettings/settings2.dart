import 'package:flutter/material.dart';
//import 'package:mudawah/components/bottomNav.dart';

class settings2 extends StatefulWidget {
  const settings2({Key? key}) : super(key: key);

  @override
  State<settings2> createState() => _settings1State();
}

class _settings1State extends State<settings2> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
      ),
    );
  }
}
