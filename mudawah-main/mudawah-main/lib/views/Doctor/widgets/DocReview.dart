import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/models/user_models/add_doctor_rate_body.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/utils/app_constants.dart';

import '../../../colors.dart';
import '../../../components/show_custom_snackbar.dart';
import '../../../models/doctor_model.dart';
import '../../../models/user_models/doctor.dart';
import '../../../models/user_models/rate.dart';
import '../../../others/functions/check_internet.dart';

class reviews extends StatefulWidget {
  reviews({Key? key, required this.doctor}) : super(key: key);
  final Doctorr doctor;
  int s = 0;
  @override
  State<reviews> createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
  TextEditingController mAddRateController = TextEditingController();

  double rate = 3.0;
  bool rated = false;

  bool _checkIfAlreadyRated() {
    widget.doctor.rates.forEach((element) {
      if (AppCostants.user.id == element.user.id) {
        rated = true;
      }
    });
    return rated;
  }

  @override
  void initState() {
    // TODO: implement initState
    Get.find<DoctorController>().getDoctorRates(widget.doctor.id);
    _checkIfAlreadyRated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _addRateLocally() {
      Rates rates = Rates(
          user: AppCostants.user,
          doctor: widget.doctor.id,
          starsNumber: rate,
          comment: mAddRateController.text);
      widget.doctor.rates.add(rates);
      setState(() {
        rated = true;
        widget.doctor.rated = true;
        widget.doctor.rate_average = Get.find<DoctorController>().rateAverage;
        print('rate doctor is : ${widget.doctor.rate_average}');
      });
    }

    _addNewRate() async {
      var controller = Get.find<DoctorController>();

      if (await checkInternet()) {
        AddRateBody addRateBody = AddRateBody(
            clinicId: 0,
            doctorId: widget.doctor.id,
            comment: mAddRateController.text,
            starsNumber: rate);
        widget.doctor.rate_average = await controller.addNewRate(addRateBody);
        print('doctor rate func is : ${widget.doctor.rate_average}');
        setState(() {});
        // controller.getDoctorRates(widget.doctor.id);
        if (controller.addRateLoaded == 2) {
          _addRateLocally();
        } else {
          showCustomSnackBar('حدث خطأ ما ، لم يتم إضافة تقييمك');
        }
      } else {
        showCustomSnackBar(
            ' لست متصلاً بالانترنت في الوقت الحالي ، يرجى الاتصال بالانترنت ومن ثم إعادة المحاولة');
      }
    }

    double pagewidth = MediaQuery.of(context).size.width;
    double pageheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * .04),
      child: SingleChildScrollView(
        child: GetBuilder<DoctorController>(
          builder: (controller) => (controller.addRateLoaded == 1)
              ? Container(
                  width: double.maxFinite,
                  height: 600,
                  color: Color(0xFFFFFFFF),
                  child: SpinKitCubeGrid(
                    color: textcolor1,
                    size: 80.0,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text(
                              "قام ${widget.doctor.rates.length} شخص بالمراجعة"),
                          Spacer(
                            flex: 3,
                          ),
                          Icon(
                            Icons.star,
                            size: 25.0,
                            color: Color(0xFF37CAEC),
                          ),
                          Text(
                            widget.doctor.rate_average.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    (rated ||
                            widget.doctor.rated ||
                            AppCostants.user.id == widget.doctor.id)
                        ? Container()
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 26.0,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        size: 24.0,
                                        color: Color(0xFF37CAEC),
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                        rate = rating;
                                      },
                                    ),
                                    Text(
                                      "اضف مراجعة",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*   Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  obscureText: false,
                                  controller: mAddRateController,
                                  minLines: 3,
                                  textAlign: TextAlign.right,
                                  textInputAction: TextInputAction.newline,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      //labelText: 'محتوى المقال',
                                      hintText: 'اضافة تعليق .....',
                                      hintMaxLines: 1),
                                ))),
                      */
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    height: SizeConfig.screenHeight * .2,
                                    child: TextField(
                                      maxLines: 3,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(71),
                                      ],
                                      onChanged: (v) {
                                        if (v.length == 70 && widget.s == 0) {
                                          showCustomSnackBar(
                                              'لا يمكنك اضافة تعليق أكبر من هذا ');
                                          widget.s = 1;
                                        }
                                      },
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 20),
                                      controller: mAddRateController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primeteilcolor,
                                          ),
                                        ),
                                        prefixIcon: TextButton(
                                          onPressed: () {
                                            _addNewRate();

                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(9),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(550)),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                                  Color(0xff00C9FD),
                                                  Color(0xff84DFB4),
                                                ],
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.arrow_left,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              /*        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 55,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xff00C9FD),
                                  Color(0xff84DFB4),
                                ],
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();

                                _addNewRate();
                                setState(() {
                                  rated = true;
                                  widget.doctor.rated = true;
                                });
                              },
                              child: Text(
                                ' نشر ',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: primeteilcolor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                */
                            ],
                          ),
                    SingleChildScrollView(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: widget.doctor.rates.length,
                        itemBuilder: (BuildContext context, int index) {
                          return reviewItem(
                              context,
                              widget.doctor.rates[index].user.name,
                              widget.doctor.rates[index].starsNumber,
                              widget.doctor.rates[index].comment,
                              "منذ يوم");
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget reviewItem(BuildContext context, String username, var rat,
      String comment, String dat) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              /*  Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      dat,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
             */
              /*   Expanded(
                flex: 3,
                child: Text(
                  username,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    Doctor.profile[0].doctorimg,
                  ),
                  radius: 25.5,
                ),
              )
           */
              Text(
                username,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * .1,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  Doctor.profile[0].doctorimg,
                ),
                radius: 25.5,
              ),
            ],
          ),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //flex: 3,
                Spacer(
                  flex: 3,
                ),
                Expanded(
                  flex: 2,
                  child: RatingBar.builder(
                    initialRating: double.parse(rat.toString()),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 16.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      size: 10.0,
                      color: Color(0xFF37CAEC),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  child: Text(
                comment,
                textAlign: TextAlign.right,
              ))
            ],
          ),
        ),
        Divider(
          indent: 30,
          endIndent: 30,
          color: textcolor2,
        ),
      ],
    );
  }
}
