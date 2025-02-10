// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/controllers/appointmentController.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/models/appointment_models/get_work_days_model_body.dart';
import 'package:mudawah/models/appointment_models/time.dart';
import 'package:mudawah/models/facibility_models/work_day.dart';
import 'package:mudawah/models/user_models/doctor.dart';
import 'package:mudawah/others/size_config.dart';
import 'package:mudawah/utils/app_constants.dart';
import 'package:mudawah/views/appointment/SecoundRoute.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' as intl;

import '../../components/show_custom_snackbar.dart';
import '../../models/facibility_models/clinic.dart';
import '../../models/facibility_models/hospital.dart';
import '../../models/response_model.dart';
import '../../others/routes/routes.dart';
import '../Doctor/widgets/work_time_card.dart';
import '../payment/payment.dart';

class appointment extends StatefulWidget {
  const appointment({Key? key}) : super(key: key);

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  @override
  void initState() {
    print('hioos');
    if (buttons1.isNotEmpty) {
      appointmentAdd.time = buttons1[0];
      Get.find<AppointmentController>().changAppointment(0, -1);
      Get.find<AppointmentController>().changAppointment(1, -1);
    }

    // TODO: implement initState
    buttons1 = [];
    buttons2 = [];
    workDays = [];
    mNameController.text = AppCostants.user.name!;
    if (AppCostants.user.phoneNumber.isNotEmpty) {
      mPhoneController.text = AppCostants.user.phoneNumber[0].phoneNumber!;
    }
    Get.find<AppointmentController>().disWorkDays = [];
//  _getWorkDays();
    _getInitialPeriods();

    super.initState();
  }

  var argumentData = Get.arguments;
  HospitalJson clinic = HospitalJson();
  Doctorr doctor = Doctorr();
  String dropdownValue = 'اختر';
  String dropdownV = 'يناير';
  String dropdown = '2022';
  String gender = "ذكر";
  final datetime = DateTime.now();
  final controller = GroupButtonController();
  bool showMorning = false;
  bool showEvening = false;
  List<Periods> periods = [];
  List<WorkDays> workDays = [];
  List<String> buttons1 = [];
  List<String> buttons2 = [];
  WorkDays selectedDay = WorkDays();
  late Appointment appointmentAdd = new Appointment();
  //bool isSelected = false;
  int isSelected = 0;
  //final List<bool> isSelected = <bool>[true, false, false];
  bool isChecked = false;
  int defaultButton1 = -1;
  int defaultButton2 = -1;

  //textControllers
  TextEditingController mNameController = TextEditingController();
  TextEditingController mPhoneController = TextEditingController();
  TextEditingController mNoteController = TextEditingController();

  _getButtonsValuesFromPeriod(Periods period) {
    String HourtimeFrom = period.fromTime!.substring(0, 2);
    int intHourTimeFrom = int.parse(HourtimeFrom);

    String MinutstimeFrom = period.fromTime!.substring(3, 5);
    int intMinutsTimeFrom = int.parse(MinutstimeFrom);
    //final from = TimeOfDay(hour: intHourTimeFrom, minute: intMinutsTimeFrom);

    print('time from hours: ${intHourTimeFrom}');
    print('time from minuts: ${intMinutsTimeFrom}');

    String HourtimeTo = period.toTime!.substring(0, 2);
    int intHourTimeTo = int.parse(HourtimeTo);

    String MinutstimeTo = period.toTime!.substring(3, 5);
    int intMinutsTimeTo = int.parse(MinutstimeTo);
    //final to = TimeOfDay(hour: intHourTimeTo, minute: intMinutsTimeTo);
    final interval = Duration(minutes: 30);

    //print('time to hours: ${intHourTimeTo}');
    //print('time to minuts: ${intMinutsTimeTo}');
    //getTimeSlots(from, to, interval);
    //log('time log');
    //_handleLoopTime(
    //    intMinutsTimeFrom, intMinutsTimeFrom, intHourTimeTo, intMinutsTimeTo);
  }

  List<String> _getTimeGroup(Periods period) {
    print('periods is : ${period.fromTime}');
    List<String> buttons = [];
    Time t = Time(period: period);
    t.convertTimeToInteger();
    int startHours = t.startHours;
    int startMinuts = t.startMinuts;
    int endHours = t.endHours;
    int endMinuts = t.endMinuts;

    int sub = endHours - startHours;
    int convertsingedNumber(int sub) {
      String tempString = sub.toString();
      String tempString1 = tempString.substring(1, tempString.length);
      print(tempString1);
      int sub1 = int.parse(tempString1);
      return sub1;
    }

    if (sub < 0) {
      sub = convertsingedNumber(sub);
      print(sub);
    }

    String endMerge = '';
    int minutsAfter;
    int s = 0;
    int count = 0;
    for (int i = 0; i < sub; i++) {
      //h 8
      while (startMinuts < 61) {
        //0  //30 //60
        //m 0
        //m 30
        count++;
        if (startHours >= 13) {
          startHours = (startHours - 13) + 1;
          s = 1;
        }
        minutsAfter = startMinuts;
        if (startMinuts == 60) {
          //    startMinuts += 1;
          minutsAfter = 00;
          startHours += 1; //9:00
          if (startHours == 13) {
            startHours = 1;
            s = 1;
          }
          if (s == 1 || i == 0) {
            endMerge = startHours.toString() +
                ':' +
                minutsAfter.toString() +
                '0' +
                ' م';
          } else {
            endMerge = startHours.toString() +
                ':' +
                minutsAfter.toString() +
                '0' +
                ' ص';
          }
        } else {
          if (s == 1) {
            endMerge =
                startHours.toString() + ':' + minutsAfter.toString() + ' م';
          } else {
            endMerge =
                startHours.toString() + ':' + minutsAfter.toString() + ' ص';
          }
        }
        buttons.add(endMerge); //8:0 //8:30 //9:00
        // print('startHours first is: ${endMerge} ');
        startMinuts += 30; //30 //60
      }
      startMinuts = 30;
      //if (startHours == 13) startHours = 1;

      //print('startHours is: ${startHours} ${startMinuts}');
    }
    // print('length is ${buttons.length}');
    // print('hello othman');
    print('count is : ${count}');
    buttons[0] = buttons[0] + '0';
    buttons.removeAt(buttons.length - 1);
    //print('buttons is : ${buttons[buttons.length]}');
    return buttons;
  }

  /* Iterable<TimeOfDay>? getTimeSlots(
      TimeOfDay startTime, TimeOfDay endTime, Duration interval) {
    var hour = startTime.hour;
    var minute = startTime.minute;
    log('othman');
    log('hour${hour}');

    do {
      TimeOfDay(hour: hour, minute: minute);
      minute += interval.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
        log('hour${hour}');
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));
  }
*/
  _handleLoopTime(int hoursFrom, int minutsFrom, int hoursTo, int minutsTo) {
    while (hoursFrom < hoursTo) {
      while (minutsFrom < 60) {}
    }
  }

  _sendNewAppointment() async {
    appointmentAdd.clinicId = clinic.id;
    appointmentAdd.doctorId = doctor.id;
    appointmentAdd.isFirstTime = (isChecked) ? 1 : 0;
    appointmentAdd.patientName = mNameController.text;
    appointmentAdd.patientPhone = mPhoneController.text;
    appointmentAdd.note = mNoteController.text;
    appointmentAdd.price = Get.find<AppointmentController>().price;
    log('hi not3');
    //appointmentAdd.workday_period_id = 1;
    appointmentAdd.stateId = 1;
    if (appointmentAdd.time == null) {
      showCustomSnackBar('يرجى اختيار وقت الحجز');
    } else if (appointmentAdd.patientName == null) {
      log('hi not');
      showCustomSnackBar('يرجى ادخال اسم المريض');
    } else if (appointmentAdd.patientPhone == null) {
      showCustomSnackBar('يرجى رقم التلفون للتواصل');
    } else {
      log('hi not22');
      log('appointment body is : ${appointmentAdd.toJson()}');
      ResponseModel responseModel = await Get.find<AppointmentController>()
          .sendAppointment(appointmentAdd);
      if (responseModel.isSuccess) {
        _defaultValuesHandle();
      }
    }

    //appointmentAdd.patientAge = 18;

    //_defaultValuesHandle();
  }

  _defaultValuesHandle() {
    mNameController.text = '';
    mPhoneController.text = '';
    mNoteController.text = '';
  }

  _getWorkDays() {
    Get.put(AppointmentController(appointmentRepo: Get.find()));
    var controller = Get.find<AppointmentController>();
    GetWorkDaysBody getWorkDaysBody =
        GetWorkDaysBody(doctorId: doctor.id, clinicId: clinic.id);
    controller.getWorkDays(getWorkDaysBody);
    print('work days func appointment  ${workDays.length}');

    workDays = [];
    workDays = controller.disWorkDays;
    print('work days func after appointment  ${workDays.length}');
  }

  _getInitialPeriods() {
    var date = DateTime.now();
    print('get periods date is ${date}');
    appointmentAdd.date = date.toString();
    log('hello');
    buttons1.clear();
    buttons2.clear();
    var controller = Get.find<AppointmentController>();
    var date1 = intl.DateFormat('EEEE').format(date);
    controller.disWorkDays.forEach((element) {
      print('real day is${element.code}');
      print('fake day is${date1}');
      if (element.code == date1) {
        selectedDay = element;
        showMorning = true;
        if (element.periods.length != 0) {
          buttons1 = _getTimeGroup(element.periods![0]);
          if (element.periods.length > 1) {
            print('more');
            buttons2 = _getTimeGroup(element.periods![1]);
          }

          log('got periods');
        }
        print('true');
      }
    });
    setState(() {});

    /// e.g Thursday
  }

  @override
  Widget build(BuildContext context) {
    clinic = argumentData['clinic'];
    doctor = argumentData['doctor'];

    SizeConfig().init(context);
    return Scaffold(
        body: GetBuilder<AppointmentController>(
      builder: (appointmentController) => (appointmentController
                  .sendAppointmentLoaded ==
              1)
          ? Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: SpinKitWave(
                color: textcolor1,
                size: 80.0,
              ),
            )
          : Stack(
              children: [
                Container(
                  width: 428,
                  height: SizeConfig.screenHeight * .6,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0x70a8e377), Color(0xff00c9fd)],
                    ),
                  ),
                ),
                //---------------------------------------------------------------------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          )),
                      const Padding(
                        padding: const EdgeInsets.only(right: 138),
                        child: Text(
                          "حجز موعد",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      //---------------------------------------------------------------------------------------------------------------------------------------------
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130, right: 10, left: 10),
                  child: SingleChildScrollView(
                      child: Container(
                    width: 396,
                    height: (buttons1.isEmpty && buttons2.isEmpty)
                        ? SizeConfig.screenHeight * 1.6
                        : SizeConfig.screenHeight * 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "تفاصيل الحجز",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      CupertinoIcons.news_solid,
                                      //  MyFlutterApp.akar_icons_book_close,
                                      color: Colors.tealAccent, size: 25,
                                    )),
                              ],
                            ),
                          ),
                          const //--------------------------------------------------
                          Divider(
                            thickness: 1,
                          ),
                          //--------------------------------------------------
                          //--------------------------------------------------
                          /*    Container(
                      width: SizeConfig.screenWidth * .4,
                      height: SizeConfig.screenHeight * .001,
                      color: Colors.grey,
                    ),
                    workDays != null
                        ? GetBuilder<AppointmentController>(
                            builder: (AppointmentController) =>
                                (AppointmentController.disWorkDays != null)
                                    ? Container(
                                        height: SizeConfig.screenHeight * .15,
                                        width: SizeConfig.screenWidth * .90,
                                        child: ListView.builder(
                                            reverse: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: workDays.length,
                                            itemBuilder: (context, index) {
                                              return WorkTimeCard(
                                                  workDay: AppointmentController
                                                      .disWorkDays[index]);
                                            }),
                                      )
                                    : Container(),
                          )
                        : Container(),
        */
                          /*          Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                            borderSide:
                                BorderSide(color: Colors.tealAccent, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.tealAccent, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.teal[50],
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'اختر',
                          'مستشفى عدن',
                          'عيادة 1',
                          'عيادة 2'
                          /**
                           * 'يناير',
                          'فبراير',
                          'مارس',
                          'أبريل',
                          'مايو',
                          'يونيو',
                          'يوليو',
                          'أغسطس',
                          'سبتمبر',
                          'أكتوبر',
                          'نوفمبر',
                          'ديسمبر',
                           */
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            alignment: AlignmentDirectional.topEnd,
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
             */ ///////////////////////////////////////////////////////

                          ///////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 0, right: 0, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                  ////height: 90,
                                  width: MediaQuery.of(context).size.width,
                                  child: GetBuilder<AppointmentController>(
                                    builder: (controller) => Container(
                                      margin:
                                          EdgeInsets.only(right: 5, left: 5),
                                      child: DatePicker(
                                        DateTime.now(),
                                        height: SizeConfig.screenHeight * .15,
                                        locale: "ar_YE",
                                        initialSelectedDate: DateTime.now(),
                                        selectionColor: Color(0xff60cbe2),
                                        selectedTextColor: Colors.white,
                                        onDateChange: (date) {
                                          appointmentAdd.time = null;
                                          log('hello ${date.toString()}');
                                          buttons1.clear();
                                          buttons2.clear();

                                          var date1 = intl.DateFormat('EEEE')
                                              .format(date);
                                          String selectedDate =
                                              date.toString().substring(0, 10);
                                          appointmentAdd.date = selectedDate;

                                          print(
                                              'selected date is : ${selectedDate}');
                                          controller.disWorkDays
                                              .forEach((element) {
                                            print('real day is${element.code}');
                                            print('fake day is${date1}');
                                            if (element.code == date1) {
                                              selectedDay = element;
                                              showMorning = true;
                                              if (element.periods.length != 0) {
                                                buttons1 = _getTimeGroup(
                                                    element.periods![0]);
                                                if (element.periods.length >
                                                    1) {
                                                  print('more');
                                                  buttons2 = _getTimeGroup(
                                                      element.periods![1]);
                                                }

                                                log('got periods');
                                              }
                                              print('true');
                                            }
                                          });
                                          setState(() {});

                                          /// e.g Thursday
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /*     GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(5.0),
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      children: buttons1
                          .map((data) => Card(
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data),
                                )),
                              ))
                          .toList(),
                    ),
              */
                          (buttons1.length >= 0)
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "الفترة الاولى",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.sunny,
                                            color: Colors.tealAccent,
                                            size: 25,
                                          )),
                                    ],
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GetBuilder<AppointmentController>(
                                builder: (appointmentController) => GroupButton(
                                  isRadio: true,
                                  controller: GroupButtonController(
                                    selectedIndex:
                                        appointmentController.buttonselect1,
                                    onDisablePressed: (i) => debugPrint(
                                        'Disable Button #$i pressed'),
                                  ),
                                  options: GroupButtonOptions(
                                    spacing: 7.5,
                                    mainGroupAlignment:
                                        MainGroupAlignment.start,
                                    //groupingType: GroupingType.row,
                                    unselectedBorderColor: Colors.tealAccent,
                                    selectedColor: textcolor1,
                                    selectedBorderColor: Colors.tealAccent,
                                    groupingType: GroupingType.wrap,
                                    direction: Axis.horizontal,
                                    borderRadius: BorderRadius.circular(30),
                                    buttonHeight: 30,
                                    buttonWidth: 70,
                                  ),
                                  // onSelected: (index, isSelected) => print('$index button is selected'),
                                  buttons: buttons1,
                                  onSelected: (val, i, selected) {
                                    log(val.toString());
                                    print('hi');
                                    log('hi');
                                    appointmentAdd.time = val.toString();
                                    appointmentController.changAppointment(
                                        0, i);
                                  },
                                ),
                              )
                            ],
                          ),
                          (buttons2.length >= 0)
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "الفترة الثانية",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons.moon_fill,
                                            color: Colors.tealAccent,
                                            size: 25,
                                          )),
                                    ],
                                  ),
                                )
                              : Container(),

                          ///////////////////////////////////////////////////////////
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GetBuilder<AppointmentController>(
                                builder: (appointmentController) => GroupButton(
                                  isRadio: true,
                                  controller: GroupButtonController(
                                      selectedIndex:
                                          appointmentController.buttonselect2,
                                      onDisablePressed: (i) {}),
                                  options: GroupButtonOptions(
                                    spacing: 7.5,
                                    mainGroupAlignment:
                                        MainGroupAlignment.start,
                                    //groupingType: GroupingType.row,
                                    unselectedBorderColor: Colors.tealAccent,
                                    selectedBorderColor: Colors.tealAccent,
                                    groupingType: GroupingType.wrap,
                                    direction: Axis.horizontal,
                                    borderRadius: BorderRadius.circular(30),
                                    buttonHeight: 30,
                                    buttonWidth: 70,
                                  ),
                                  // onSelected: (index, isSelected) => print('$index button is selected'),
                                  buttons: buttons2,
                                  onSelected: (val, i, selected) {
                                    //_extendedExampleController.selectedGroupingType = i;
                                    //  appointmentAdd.time = val.toString();

                                    appointmentController.changAppointment(
                                        1, i);
                                  },
                                ),
                              )
                            ],
                          ),
                          /*      Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "طريقة الحجز",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.creditcard_fill
                                // MyFlutterApp.ant_design_credit_card_filled
                                ,
                                color: Colors.tealAccent,
                                size: 25,
                              )),
                        ],
                      ),
                    ),
               */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GetBuilder<AppointmentController>(
                                builder: (controller) => Text(
                                  (controller.price == null)
                                      ? "الرسوم :لم يتم التحديد "
                                      : "الرسوم :${controller.price} ",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.hand_point_left,
                                    color: Colors.tealAccent,
                                    size: 25,
                                  )),
                            ],
                          ),
                          ////////////////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "معلومات المريض",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      //MyFlutterApp.ant_design_info_circle_outlined
                                      CupertinoIcons.info_circle,
                                      color: Colors.tealAccent, size: 25,
                                    )),
                              ],
                            ),
                          ),
                          /////////////////////////////////////////////////////////////////////////////

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  " اسم المريض  ",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 50,
                                height: 50,
                                child: TextFormField(
                                  controller: mNameController,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(9)),
                                      borderSide: BorderSide(
                                        color: Colors.tealAccent,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.tealAccent, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),

                          ///////////// Radiobutton//////////////////////////////////////////////
                          /*       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: RadioListTile(
                            activeColor: Colors.cyanAccent,
                            title: Text("انثى"),
                            value: "انثى",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 150,
                          child: RadioListTile(
                            title: Text("ذكر"),
                            activeColor: Colors.cyanAccent,
                            value: "ذكر",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
               */ ///////////// BirthDay//////////////////////////////////////////////
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 10, right: 15),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       Text(
                          //         "تاريخ الميلاد",
                          //         textAlign: TextAlign.right,
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Container(
                          //       width: 100,
                          //       height: 50,
                          //       child: TextFormField(
                          //         textAlign: TextAlign.right,
                          //         decoration: InputDecoration(
                          //           hintTextDirection: TextDirection.rtl,
                          //           hintText: '1',
                          //           border: OutlineInputBorder(
                          //             borderRadius:
                          //                 BorderRadius.all(Radius.circular(9)),
                          //             //borderSide: BorderSide(color: Colors.tealAccent),
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //                 color: Colors.tealAccent, width: 2.0),
                          //             borderRadius: BorderRadius.circular(10.0),
                          //           ),
                          //         ),
                          //         keyboardType: TextInputType.number,
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 100,
                          //       height: 50,
                          //       child: TextFormField(
                          //         textAlign: TextAlign.right,
                          //         decoration: InputDecoration(
                          //           hintTextDirection: TextDirection.rtl,
                          //           hintText: '9',
                          //           border: OutlineInputBorder(
                          //             borderRadius:
                          //                 BorderRadius.all(Radius.circular(9)),
                          //             borderSide: BorderSide(
                          //               color: Colors.tealAccent,
                          //               width: 2,
                          //             ),
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //                 color: Colors.tealAccent, width: 2.0),
                          //             borderRadius: BorderRadius.circular(10.0),
                          //           ),
                          //         ),
                          //         keyboardType: TextInputType.number,
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 100,
                          //       height: 50,
                          //       child: TextFormField(
                          //         textAlign: TextAlign.right,
                          //         decoration: InputDecoration(
                          //           hintTextDirection: TextDirection.rtl,
                          //           hintText: '1990',
                          //           border: OutlineInputBorder(
                          //             borderRadius:
                          //                 BorderRadius.all(Radius.circular(9)),
                          //             //borderSide: BorderSide(color: Colors.tealAccent),
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide: const BorderSide(
                          //                 color: Colors.tealAccent, width: 2.0),
                          //             borderRadius: BorderRadius.circular(10.0),
                          //           ),
                          //         ),
                          //         keyboardType: TextInputType.number,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          ///////////// Number//////////////////////////////////////////////

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "رقم الهاتف ",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /*         Container(
                          width: 150,
                          height: 50,
                          child: TextFormField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9)),
                                //borderSide: BorderSide(color: Colors.tealAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.tealAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                 */
                              Container(
                                width: SizeConfig.screenWidth * .5,
                                height: 50,
                                child: TextFormField(
                                  controller: mPhoneController,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(9)),
                                      borderSide: BorderSide(
                                        color: Colors.tealAccent,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.tealAccent, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          ///////////// MultiLine Text//////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.only(top: 30, right: 15),
                            child: Text(
                              "تفاصيل الحالة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: 450,
                            height: 150,
                            child: TextFormField(
                              controller: mNoteController,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                helperText: 'حقل اختياري',
                                helperStyle: TextStyle(color: Colors.green),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                  borderSide: BorderSide(
                                    color: Colors.tealAccent,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.tealAccent, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              maxLength: 100,
                              maxLines: 50,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          ///////////// Checkbox//////////////////////////////////////////////
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'تم زيارة العيادة مسبقاً ',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ), //Text

                                /** Checkbox Widget **/

                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.tealAccent,
                                  focusColor: Colors.tealAccent,
                                  hoverColor: Colors.cyan,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ], //<Widget>[]
                            ),
                          ),
                          //Row
                          SizedBox(
                            height: 30,
                          ),
                          //Button/////////////////////////////////////////////////////////////////\
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Payment())),
                                child: Text('هنا'),
                              ),
                              Text('للتعرف على طرق الحجز اضغط'),
                            ],
                          ),

                          Container(
                            // color: Colors.white,
                            padding: const EdgeInsets.all(0.0),

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 0.0,
                              ),
                              onPressed: () {
                                _sendNewAppointment();

                                /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );*/
                              },
                              child: Container(
                                height: 50.0,
                                width: 600,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,

                                    /// Alignment(0.0, 0.0),
                                    end: Alignment(1, 0.001),
                                    colors: <Color>[
                                      Color(0xff00F2D5),
                                      Colors.white
                                    ],
                                  ),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: const Text(
                                  "انشاء",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              ],
            ),
    ));
  }

  Widget periodCard(Periods period) {
    String timeFrom = period.fromTime!.substring(0, 5);
    String timeTo = period.fromTime!.substring(0, 5);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(timeFrom.toString()),
        SizedBox(
          width: SizeConfig.screenWidth * .08,
        ),
        Text(timeTo.toString()),
      ],
    );
  }
}
