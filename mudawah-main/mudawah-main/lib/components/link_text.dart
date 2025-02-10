import 'package:flutter/material.dart';

import '../colors.dart';
import '../others/size_config.dart';

class TextLink extends StatelessWidget {
  const TextLink(
      {Key? key, required this.text, required this.press, required this.type})
      : super(key: key);
  final String text;
  final Function() press;
  final int type;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: press,
        child: Text(
          text,
          style: TextStyle(
              color: (type == 1) ? textcolor1 : textcolor2,
              fontSize: SizeConfig.screenWidth * .05),
        ));
  }
}
