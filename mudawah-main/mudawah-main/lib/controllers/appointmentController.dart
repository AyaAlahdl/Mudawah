import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mudawah/data/repositories/appointment_repository.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/models/appointment_models/update_state_body.dart';
import 'package:mudawah/models/facibility_models/work_day.dart';
import 'package:mudawah/models/post_models/like_body.dart';
import 'package:mudawah/models/post_models/update_seen_body.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../components/show_custom_snackbar.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/post_repository.dart';
import '../models/User.dart';
import '../models/appointment_models/get_work_days_model_body.dart';
import '../models/login_body.dart';
import '../models/post.dart';
import '../models/posts.dart';
import '../models/response_model.dart';
import '../others/routes/routes.dart';

class AppointmentController extends GetxController {
  AppointmentRepo appointmentRepo;
  bool isLoaded = false;
  List<Post> _postsList = [];
  get postsList => _postsList;
  var buttonselect1 = -1;
  int buttonselect2 = -1;
  int sendAppointmentLoaded = 0;
  List<Appointment> _appointmentsList = [];
  List<Appointment> _disAppointmentsList = [];
  List<Appointment> _doctorAppointmentsList = [];
  List<Appointment> _disDoctorAppointmentsList = [];
  get disDoctorAppointmentList => _disDoctorAppointmentsList;
  List<WorkDays> _workDays = [];
  List<WorkDays> disWorkDays = [];
  List<WorkDays> _toRemoveItems = [];
  var price;

  get disAppointmentsList => _disAppointmentsList;

  AppointmentController({required this.appointmentRepo});

  Future<ResponseModel> sendAppointment(Appointment appointment) async {
    sendAppointmentLoaded = 1;
    update();
    Response response = await appointmentRepo.sendAppointment(appointment);
    ResponseModel responseModel;
    log('appointment send response : ${response.statusCode}');
    var jsonData = response.body['data'];
    if (response.statusCode == 200 || response.statusCode == 201) {
      sendAppointmentLoaded = 2;
      responseModel = ResponseModel(true, '');
      Get.offAndToNamed(Routes.SecondRoute);
      isLoaded = true;
      print('posts response : ${response.statusCode}');
      print('post get is : ${jsonData}');
      getUserAppointments();
      getDoctorAppointments();
    } else {
      responseModel = ResponseModel(false, '');
      sendAppointmentLoaded = 3;
    }
    update();
    return responseModel;
  }

  Future<void> getUserAppointments() async {
    Response response = await appointmentRepo.getUserAppointments();
    ResponseModel responseModel;

    print('response doctor appointments is ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonData = response.body['data'];
      _appointmentsList = [];
      for (var item in jsonData) {
        var element = Appointment.fromJson(item);
        _appointmentsList.add(element);
      }
      _disAppointmentsList = _appointmentsList;
      print('appointments are${_disAppointmentsList.length}');
    }
    update();
  }

  Future<void> getDoctorAppointments() async {
    Response response = await appointmentRepo.getDoctorAppointments();
    ResponseModel responseModel;

    print('response doctor appointments is ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonData = response.body['data'];
      _doctorAppointmentsList = [];
      for (var item in jsonData) {
        var element = Appointment.fromJson(item);
        _doctorAppointmentsList.add(element);
      }
      _disDoctorAppointmentsList = _doctorAppointmentsList;
      // print('appointments are${_disAppointmentsList.length}');
    }
    update();
  }

  Future<void> getWorkDays(GetWorkDaysBody getWorkDaysBody) async {
    Response response = await appointmentRepo.getWorkDays(getWorkDaysBody);
    print('work day json${getWorkDaysBody.toJson()}');
    print('response appointments wd is ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonData = response.body['doctors'];
      var workDayData = jsonData['workday'];

      //price related
      price = 0;
      var jsonData1 = response.body['price'];
      price = jsonData1['price'];
      print('price is : $price');
      disWorkDays = [];
      _workDays = [];
      _toRemoveItems = [];

      print('work days func controller co is ${disWorkDays.length}');
      print('work days func2 controller co is ${_workDays.length}');
      print('work days func3 controller co is ${_toRemoveItems.length}');
      for (var item in workDayData) {
        var element = WorkDays.fromJson(item);
        //_workDays.add(element);
        _toRemoveItemsFunc(element);
      }
      _filterWorkDays();

      print('appointments are${_disAppointmentsList.length}');
    }

    update();
  }

  Future<void> updateAppointmentState(
      UpdateAppointmentState updateAppointmentState) async {
    Response response =
        await appointmentRepo.updateAppointmentState(updateAppointmentState);
    ResponseModel responseModel;
    log('appointment state  response : ${response.statusCode}');

    var jsonData = response.body;
    if (response.statusCode == 200) {
      isLoaded = true;
      print('posts response : ${response.statusCode}');
      print('post get is : ${jsonData}');
    }
    update();
  }

  _toRemoveItemsFunc(WorkDays removeItem) {
    _toRemoveItems.add(removeItem);
    print('work day to removve ${removeItem.name}');
  }

  _filterWorkDays() {
    _workDays = [];
    disWorkDays = [];
    _toRemoveItems.forEach((element) {
      if (!disWorkDays.contains(element)) {
        _workDays.add(element);
      }
    });
    disWorkDays = _workDays;
    disWorkDays.forEach((element) {
      print('work day  c is: ${element.name}');
    });
    update();
  }

  changAppointment(int type, int selected) {
    if (type == 0) {
      buttonselect2 = -1;
      buttonselect1 = selected;
    } else {
      buttonselect2 = selected;
      buttonselect1 = -1;
    }
    update();
  }

  handleLogout() {
    _disAppointmentsList.clear();
    _doctorAppointmentsList.clear();
  }
}
