import 'package:flutter/material.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/views/loginSys/login_screen/components/body.dart';

import '../../../controllers/auth_controller.dart';

class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(resizeToAvoidBottomInset: true, body: Body());
  }
}
