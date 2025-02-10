import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';

import '../../../models/facibility_models/hospital.dart';
import '../../../others/routes/routes.dart';

class DeviceTabItem extends StatelessWidget {
  //const TabItem({Key? key}) : super(key: key);
  final String title;
  final String content;
  final String sub;
  final String image;
  final int imageType;
  const DeviceTabItem({
    required this.title,
    required this.content,
    required this.sub,
    required this.image,
    required this.imageType,
  });

  @override
  Widget build(BuildContext context) {
    final TitleStyle = TextStyle(
      color: Color(0xFF37CAEC),
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      height: 1.0,
    );
    final ContentStyle = TextStyle(
      color: Color(0xFF878787),
      fontSize: 13.2,
      height: 1.0,
    );
    double pagewidth = MediaQuery.of(context).size.width;
    double pageheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Container(
        height: 150,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: cardscolor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 4,
              color: Colors.black12,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 120,
                child: Column(
                  children: [
                    //SizedBox(height: 10),
                    SizedBox(
                      height: 17,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: pagewidth - 140,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(right: 5, left: 5),
                        alignment: Alignment.centerRight,
                        child: Text(
                          title,
                          textDirection: TextDirection.rtl,
                          style: TitleStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: pagewidth - 140, maxHeight: 80),
                      child: Text(
                        content,
                        //  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                        textDirection: TextDirection.ltr,
                        style: ContentStyle,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: pagewidth - 140,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(right: 5, left: 5, top: 20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          sub,
                          textDirection: TextDirection.rtl,
                          style: TitleStyle,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff878787),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: (imageType == 0)
                          ? DecorationImage(
                              //image: ExactAssetImage('assets/splashscreen/user.png'),
                              image: ExactAssetImage(image),
                              fit: BoxFit.fill)
                          : DecorationImage(
                              //image: ExactAssetImage('assets/splashscreen/user.png'),
                              image: getImageNetwork(image),
                              fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
