import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mudawah/models/user_models/doctor.dart';
import 'package:mudawah/others/functions/get_image_from_iternet.dart';

import '../../../others/routes/routes.dart';

class DoctorTab extends StatelessWidget {
  // const DoctorTab({Key? key}) : super(key: key);
  String? name;
  String? clinic;
  int? price;
  String? daysfrom;
  String? daysto;
  String? time1from;
  String? time2from;
  String? time2to;
  String? time1to;
  String? img;
  double? stars;
  int? imageType;
  Doctorr? doctor;
  DoctorTab(
      {this.doctor,
      this.name,
      this.clinic,
      this.price,
      this.daysfrom,
      this.daysto,
      this.time1from,
      this.time1to,
      this.time2from,
      this.time2to,
      this.img,
      this.stars,
      this.imageType});
  @override
  Widget build(BuildContext context) {
    final TitleStyle = TextStyle(
      color: Color(0xFF37CAEC),
      fontSize: 17.0,
      height: 1.0,
    );
    final ContentStyle = TextStyle(
      color: Color(0xFF878787),
      fontSize: 14.0,
      height: 1.0,
    );
    final SubContentStyle = TextStyle(
      color: Color(0xFF878787),
      fontSize: 12.0,
      height: 1.0,
    );
    double pagewidth = MediaQuery.of(context).size.width;
    double pageheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        print('hi');
        Get.toNamed(Routes.doctorPf, arguments: {'doctor': doctor});
      },
      child: Container(
        height: 110,
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
                height: 80,
                child: Column(
                  children: [
                    //SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: pagewidth - 140,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(right: 5, left: 5),
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              name!,
                              textDirection: TextDirection.rtl,
                              style: TitleStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.topRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: pagewidth - 140,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(right: 5, left: 5),
                          alignment: Alignment.centerRight,
                          child: Text(
                            clinic!,
                            textDirection: TextDirection.rtl,
                            style: ContentStyle,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                    /*   SizedBox(height: 5),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: pagewidth - 140,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'من: ${daysfrom} الى: ${daysto}',
                              textDirection: TextDirection.rtl,
                              style: ContentStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.calendar,
                            color: Color(0xFF878787),
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: pagewidth - 140,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5, left: 5),
                            child: Text(
                              ' ${time2from} - ${time2to}',
                              textDirection: TextDirection.rtl,
                              style: SubContentStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.time,
                            color: Color(0xFF878787),
                            size: 20.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5, left: 5),
                            child: Text(
                              ' ${time1from} - ${time1to}',
                              textDirection: TextDirection.rtl,
                              style: SubContentStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.time,
                            color: Color(0xFF878787),
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                   */
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: pagewidth - 140,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RatingBar.builder(
                              initialRating: stars!,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 16.0,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                size: 10.0,
                                color: Color(0xFF37CAEC),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            /*       Container(
                              margin: EdgeInsets.only(right: 5, left: 5),
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${price} ري',
                                textDirection: TextDirection.rtl,
                                style: TitleStyle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                       */
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  //  color: Color(0xff878787),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          //image: ExactAssetImage('assets/splashscreen/user.png'),
                          image: imageType == 0
                              ? ExactAssetImage(img!) as ImageProvider
                              : getImageNetwork(img!),
                          fit: BoxFit.fill)),
                  // child: CircleAvatar(
                  //     radius: 20.0,
                  //     backgroundColor: Colors.white,
                  //     backgroundImage: imageType == 0
                  //         ? AssetImage(img!) as ImageProvider
                  //         : NetworkImage(img!)
                  //     // : FileImage(File(_imageFile!.path)) as ImageProvider,
                  //     ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
