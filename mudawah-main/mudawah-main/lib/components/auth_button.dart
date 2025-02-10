import 'package:flutter/material.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.text,
    required this.press,
    //   required this.buttonController
  }) : super(key: key);
  final String text;
  final Function() press;
  // final RoundedLoadingButtonController buttonController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight * .08,
        width: SizeConfig.screenWidth * .8,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-2.051272218750455e-8, -1.4947367906570435),
              end: Alignment(1.4947367906570435, -9.226483577151612e-9),
              colors: [
                Color.fromRGBO(152, 223, 225, 1),
                Color.fromRGBO(136, 194, 231, 1)
              ]),
        ),
        child: /* RoundedLoadingButton(
          color: textcolor1,
          duration: Duration(seconds: 15),
          errorColor: Colors.red,
          elevation: 0,
          onPressed: press,
          controller: buttonController,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: SizeConfig.screenWidth * .05),
            ),
          ),
        )*/
            TextButton(
          onPressed: press(),
          child: Text('تسجيل الدخول'),
        ));
  }
}
