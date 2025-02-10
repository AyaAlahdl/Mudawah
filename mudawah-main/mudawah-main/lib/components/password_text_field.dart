import 'package:flutter/material.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/others/size_config.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {Key? key,
      required this.hintText,
      required this.isPassword,
      required this.controller})
      : super(key: key);
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<PasswordTextField> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: SizeConfig.screenWidth * .9,
        child: TextField(
            controller: this.widget.controller,
            cursorColor: textcolor1,
            obscureText: (_isObsecure == false || widget.isPassword == false)
                ? false
                : true,
            keyboardType: (widget.isPassword)
                ? TextInputType.emailAddress
                : TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                suffixIconColor: textcolor1,
                contentPadding: EdgeInsets.all(SizeConfig.screenWidth * .04),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: textcolor1, fontSize: SizeConfig.screenWidth * .05),
                suffixIcon: (widget.isPassword)
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            _isObsecure = !_isObsecure;
                          });
                        },
                        child: Icon(
                          (_isObsecure)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: textcolor1,
                          size: 24,
                        ))
                    : null)),
      ),
    );
  }
}
