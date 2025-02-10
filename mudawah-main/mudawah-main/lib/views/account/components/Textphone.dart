import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mudawah/views/accountsettings/phone.dart';

import '../icons.dart';

class textPhoneEdit extends StatefulWidget {
  const textPhoneEdit({Key? key}) : super(key: key);

  @override
  State<textPhoneEdit> createState() => _textPhoneEditState();
}

class _textPhoneEditState extends State<textPhoneEdit> {
  @override
  Widget build(BuildContext context) {
    return TextPhoneEdit();
  }

  Widget TextPhoneEdit() {
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
                  '738*****',
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
}
