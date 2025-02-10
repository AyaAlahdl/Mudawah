import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return myButton();
  }

  Widget myButton() {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(CupertinoIcons.delete),
                label: Text(
                  "احدف",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0x66000000),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "الصورة الشخصية",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xcc000000),
                  fontSize: 25,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(CupertinoIcons.camera),
                label: Text(
                  ": الكاميرا",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x66000000),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(CupertinoIcons.photo),
                  label: Text(
                    ": المعرض",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x66000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile;
    });
  }
}
