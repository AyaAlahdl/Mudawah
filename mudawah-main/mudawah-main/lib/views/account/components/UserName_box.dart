import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../icons.dart';

class UserName extends StatefulWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  @override
  Widget build(BuildContext context) {
    return TextName();
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
                      "محمد",
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
    return Container(
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
                  onPressed: null,
                  child: Text(
                    'الغاء',
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'حفط',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
