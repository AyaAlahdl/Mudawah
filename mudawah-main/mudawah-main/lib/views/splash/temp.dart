import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../others/routes/routes.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Get.offAndToNamed(Routes.onBoarding);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
