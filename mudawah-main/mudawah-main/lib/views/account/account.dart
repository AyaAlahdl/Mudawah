import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mudawah/components/show_custom_snackbar.dart';
import 'package:mudawah/controllers/auth_controller.dart';
import 'package:mudawah/data/repositories/auth_repository.dart';
import 'package:mudawah/models/regisgor_body.dart';
import 'package:mudawah/models/response_model.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/account/icons.dart';
import 'package:flutter/widgets.dart';

//import '../accountSettings/phone.dart';

import '../../others/routes/routes.dart';
import '../accountsettings/phone.dart';
import 'components/MyBooking.dart';
import 'components/TextFavorite.dart';
import 'components/Textphone.dart';
import 'components/UserName_box.dart';
import 'components/account_SilverAppBar.dart';
import 'package:mudawah/models/user_models/phone_number.dart';

//import 'package:cupertino_icons/cupertino_icons.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  //PickedFile? _imageFile;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  String getImageUrlFromatter(String imageUrl) {
    return AppCostants.GET_IMAGE_URL + imageUrl;
  }

  NetworkImage getImageNetwork(String imageAvatar) {
    var url = getImageUrlFromatter(imageAvatar);
    return NetworkImage(url);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: height = height - 100.0,
            width: width,
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: 207,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0x6ba8e377), Color(0xff01c9fd)],
                    ),
                  ),
                ),
                Field(),

                Positioned(
                    bottom: 420,
                    right: 120,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Color(0xFFFFFFFF),
                      backgroundImage: (AppCostants.user.avatar == '')
                          ? _imageFile == null
                              ? AssetImage("assets/splashscreen/user.png")
                              : FileImage(File(_imageFile!.path))
                                  as ImageProvider
                          : getImageNetwork(AppCostants.user.avatar!),
                    )),
                Positioned(
                    bottom: 405,
                    right: 150,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => getImage()),
                        );
                      },
                      child: Icon(
                        CupertinoIcons.camera,
                        color: Colors.cyan,
                        size: 28.0,
                      ),
                    )),

                // Field(),

                Divider(
                  thickness: 2,
                  height: 520,
                  color: Colors.black26,
                  indent: 260,
                  endIndent: 20,
                ),
                Divider(
                  thickness: 2,
                  height: 520,
                  color: Colors.black26,
                  indent: 20,
                  endIndent: 260,
                ),

                ((AppCostants.user.roleId == 5 ||
                            AppCostants.user.roleId == '5') &&
                        (AppCostants.user.active == 1))
                    ? Positioned(
                        top: 10,
                        left: 5,
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 28,
                            color: Colors.cyan,
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.myBlog1);
                          },
                        ))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Field() {
    return Container(
      //margin:EdgeInsets.only(top: 94.0),
      padding: EdgeInsets.only(top: 300.0),
      color: Colors.transparent,

      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextName(),
          textPhoneEdit(),

          //   TextMYBooking(),
          //   TextFavorite(),
        ],
      ),
    );
  }

  Widget TextName() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => seet()),
                        );
                      },
                      icon: Icon(
                        //  CupertinoIcons.pencil,
                        MyFlutterApp.syringe_line,
                        size: 28,
                        color: Colors.cyan,
                      )),
                ),
                Spacer(),
                Text(
                  'اسم المستخدم ',
                  style: TextStyle(
                      color: Color.fromRGBO(127, 138, 142, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 10.0),
                  child: Icon(
                    // CupertinoIcons.person,
                    MyFlutterApp.user_heart_line,
                    color: Colors.cyan,
                    size: 28,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "تعديل",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 57),
                    child: Text(
                      AppCostants.user.name!,
                      style: TextStyle(
                          color: Colors.cyan,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              endIndent: 5,
              indent: 5,
            )
          ],
        ),
      ),
    );
  }

  Widget seet() {
    TextEditingController mTextController = TextEditingController();
    mTextController.text = AppCostants.user.name!;
    _save() async {
      print('name chnage');
      AppCostants.user.name = mTextController.text;
      if (mTextController.text != '') {
        RegisterBody registerBody = RegisterBody(name: mTextController.text);
        var controller = Get.find<AuthController>();
        ResponseModel responseModel = await controller.updateUser(registerBody);
        if (responseModel.isSuccess) {
          showCustomSnackBar('تم تحديث الاسم بنجاح');
          Navigator.pop(context);
        } else {
          showCustomSnackBar('حدث خطأ ما', title: 'حدث خطأ ما');
        }
      } else {
        showCustomSnackBar('يرجى ادخال اسمك للتعديل');
      }
      setState(() {});
    }

    // _save() async {
    //   if (mTextController.text != '') {
    //     RegisterBody registerBody = RegisterBody(name: mTextController.text);
    //     var controller = Get.find<AuthController>();
    //     ResponseModel responseModel = await controller.updateUser(registerBody);
    //     if (responseModel.isSuccess) {
    //       showCustomSnackBar('تم تحديث الاسم بنجاح');
    //       Navigator.pop(context);
    //     } else {
    //       showCustomSnackBar('حدث خطأ ما', title: 'حدث خطأ ما');
    //     }
    //   } else {
    //     showCustomSnackBar('يرجى ادخال اسمك للتعديل');
    //   }
    //   setState(() {});
    // }

    return SingleChildScrollView(
      child: Container(
        height: 600,

        // width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Text(
                // textDirection: TextDirection.rtl,
                'ادخل الاسم',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 15.0, left: 15.0, top: 15.0, bottom: 20.0),
              child: TextFormField(
                controller: mTextController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    CupertinoIcons.person,
                    size: 30,
                    color: Colors.cyan,
                  ),
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  // labelText: 'ادخل الاسم',
                  hintText: ' الاسم',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'لا تستخدم @ في كتابة اسمك.'
                      : null;
                },
                keyboardType: TextInputType.name,
                maxLength: 20,
              ),
            ),
            Row(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      //  Get.back();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'الغاء',
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                TextButton(
                    onPressed: () {
                      _save();
                    },
                    child: Text(
                      'حفظ',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget TextFavorite() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.back,
                        size: 28,
                        color: Colors.cyan,
                      )),
                ),
                Spacer(),
                Text(
                  'تفضيلات ',
                  style: TextStyle(
                      color: Color.fromRGBO(127, 138, 142, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 10.0),
                  child: Icon(
                    MyFlutterApp.heart_3_line,
                    //  CupertinoIcons.heart,
                    size: 28,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
              endIndent: 5,
              indent: 5,
            )
          ],
        ),
      ),
    );
  }

  /*Widget TextMYBooking() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.back,
                        size: 28,
                        color: Colors.cyan,
                      )),
                ),
                Spacer(),
                Text(
                  'مواعيدي ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(127, 138, 142, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 10.0),
                  child: Icon(
                    MyFlutterApp.health_book_line,
                    // CupertinoIcons.rectangle_stack_person_crop,
                    size: 28,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
              endIndent: 5,
              indent: 5,
            )
          ],
        ),
      ),
    );
  }
*/
  Widget textPhoneEdit() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return phone();
                        }));
                      },
                      icon: Icon(
                        MyFlutterApp.settings_3_line,
                        size: 28,
                        color: Colors.cyan,
                      )),
                ),
                Spacer(),
                Text(
                  'رقم الهاتف ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(127, 138, 142, 1),
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 10.0),
                  child: Icon(
                    CupertinoIcons.phone,
                    size: 28,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 200.0),
                child: Text(
                  (AppCostants.user.phoneNumber.isEmpty)
                      ? 'لا يوجد لديك رقم هاتف في النظام'
                      : AppCostants
                          .user
                          .phoneNumber![
                              AppCostants.user.phoneNumber!.length - 1]
                          .phoneNumber!,
                  style: TextStyle(
                      color: Colors.cyan,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              endIndent: 5,
              indent: 5,
            )
          ],
        ),
      ),
    );
  }

  Widget addingNewPost() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.myBlog1);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اضافة مقال جديد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(127, 138, 142, 1),
                        fontSize: 18,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 10.0),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 28,
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                endIndent: 5,
                indent: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getImage() {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
    if (pickedFile != null) {
      setState(() {
        //_imageFile = pickedFile as PickedFile;
        _imageFile = File(pickedFile.path);
        //   XFile fileSent = _imageFile as XFile;
        //  Get.find<AuthRepo>().uploadImage(fileSent);
        // _uploadImage();
        final bytes = File(_imageFile!.path).readAsBytesSync();
        String base64Image = "${base64Encode(bytes)}";
        _updateAvatar(base64Image);
        print("img_pan : $base64Image");
      });
    } else {
      print('no image yet');
    }
  }

  _updateAvatar(String avatarString) async {
    print('avatar is : ${avatarString}');
    RegisterBody registerBody = RegisterBody(avatar: avatarString);
    var controller = Get.find<AuthController>();
    ResponseModel responseModel = await controller.updateUser(registerBody);
    if (responseModel.isSuccess) {
      showCustomSnackBar('تم تحديث الصورة بنجاح');
      Navigator.pop(context);
    } else {
      showCustomSnackBar('حدث خطأ ما', title: 'حدث خطأ ما');
    }
    setState(() {});
    //setState(() {});
    child:
    Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: AccountSliverAppBar(
                expandedHeight: 200.0,
                imagePath: "assets/splashscreen/user.png",
                title: "حسابي"),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 120,
              ),
              UserName(),
              // textPhoneEdit(),
              //   TextMYBooking(),
              TextFavorite(),
            ]),
          )
        ],
      ),
    );
  }
}
