import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../icons.dart';

class TextFavorite extends StatelessWidget {
  const TextFavorite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Textfavorite();
  }

  Widget Textfavorite() {
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
}
