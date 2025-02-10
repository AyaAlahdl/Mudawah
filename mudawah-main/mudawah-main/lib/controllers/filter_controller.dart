import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mudawah/data/repositories/appointment_repository.dart';
import 'package:mudawah/data/repositories/filter_repository.dart';
import 'package:mudawah/data/repositories/location_repository.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/models/facibility_models/clinic.dart';
import 'package:mudawah/models/location_model/directorate_model.dart';
import 'package:mudawah/models/post_models/like_body.dart';
import 'package:mudawah/models/post_models/update_seen_body.dart';
import 'package:mudawah/models/user_models/doctor.dart';
import 'package:mudawah/models/user_models/specializition.dart';
import 'package:mudawah/views/hospital/hospital.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:mudawah/models/user_models/filter_body.dart';

import '../components/show_custom_snackbar.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/post_repository.dart';
import '../models/User.dart';
import '../models/facibility_models/hospital.dart';
import '../models/login_body.dart';
import '../models/post.dart';
import '../models/posts.dart';
import '../models/response_model.dart';
import '../others/routes/routes.dart';

class FilterController extends GetxController {
  FilterRepo filterRepo;
  bool isLoaded = false;
  int filterLoaded = 0;
  List<Specializitions> _specsList = [];
  get specsList => _specsList;

  List<Specializitions> _disSpecssList = [];
  get disSpecssList => _disSpecssList;

// doctor related
  List<Doctorr> _doctorsList = [];
  get doctorsList => _doctorsList;
  List<Doctorr> _disDoctorsList = [];
  get disDoctorsList => _disDoctorsList;

  //hospital related
  List<HospitalJson> _hospitalsList = [];
  get hospitalsList => _hospitalsList;
  List<HospitalJson> _disHospitalsList = [];
  get disHospitalsList => _disHospitalsList;

  //clinic related
  List<HospitalJson> _clinicsList = [];
  get clinicsList => _clinicsList;
  List<HospitalJson> _disClinicsList = [];
  get disClinicsList => _disClinicsList;

  FilterController({required this.filterRepo});

  Future<void> getSpecs() async {
    Response response = await filterRepo.getSpecs();
    ResponseModel responseModel;
    var jsonData = response.body;
    print('response specs is ${response.statusCode}');
    if (response.statusCode == 200) {
      _specsList = [];
      for (var item in jsonData) {
        var element = Specializitions.fromJson(item);
        _specsList.add(element);
      }
      _disSpecssList = _specsList;
      print('appointments are${_specsList.length}');
    }
  }

  Future<void> getDoctorsFilter(FilterBody filterBody) async {
    Response response = await filterRepo.getDoctorsFilter(filterBody);
    print('filter body is: ${filterBody.toJson()}');
    filterLoaded = 1;
    update();
    ResponseModel responseModel;

    if (response.statusCode == 200) {
      filterLoaded = 2;
      update();
      var jsonData = response.body['data'];
      //print('response filteeer is ${response.statusCode}');
      print('body filteeer is ${response.body['data']}');
      print('othman');
      _doctorsList = [];
      for (var item in jsonData) {
        var element = Doctorr.fromJson(item);
        _doctorsList.add(element);
      }
      _disDoctorsList = _doctorsList;
      if (_disDoctorsList.isNotEmpty) {
        _doctorsFilterCallback();
      } else {
        showCustomSnackBar('لا يوجد عناصر بناءً على الفلترة الحالية');
      }
      print('filter doctors are${_disDoctorsList.length}');
    } else {
      showCustomSnackBar('لا يوجد عناصر بناءً على الفلترة الحالية');
    }

    update();
  }

  Future<void> getHospitalsFilter(FilterBody filterBody) async {
    Response response = await filterRepo.getDoctorsFilter(filterBody);
    print('filter body is: ${filterBody.toJson()}');

    ResponseModel responseModel;
    var jsonData = response.body['data'];
    //print('response filteeer is ${response.statusCode}');
    print('body filteeer is ${response.body['data']}');
    print('othman');
    if (response.statusCode == 200) {
      _hospitalsList = [];
      for (var item in jsonData) {
        var element = HospitalJson.fromJson(item);
        _hospitalsList.add(element);
      }
      _disHospitalsList = _hospitalsList;
      if (_disHospitalsList.isNotEmpty) {
        _hospitalsFilterCallback();
      } else {
        showCustomSnackBar('لا يوجد عناصر بناءً على الفلترة الحالية');
      }
      print('filter doctors are${_disDoctorsList.length}');
    }
    update();
  }

  Future<void> getclinicsFilter(FilterBody filterBody) async {
    Response response = await filterRepo.getDoctorsFilter(filterBody);
    print('filter body is: ${filterBody.toJson()}');

    ResponseModel responseModel;
    var jsonData = response.body['data'];
    //print('response filteeer is ${response.statusCode}');
    print('body filteeer is ${response.body['data']}');
    print('othman');
    if (response.statusCode == 200) {
      _clinicsList = [];
      for (var item in jsonData) {
        var element = HospitalJson.fromJson(item);
        _clinicsList.add(element);
      }
      _disClinicsList = _clinicsList;
      if (_clinicsList.isNotEmpty) {
        _clinicsFilterCallback();
      } else {
        showCustomSnackBar('لا يوجد عناصر بناءً على الفلترة الحالية');
      }
      print('filter doctors are${_disDoctorsList.length}');
    }
    update();
  }

  _doctorsFilterCallback() {
    Get.back();
    Get.toNamed(Routes.filterDoctorCategory);
  }

  _hospitalsFilterCallback() {
    Get.back();
    Get.toNamed(Routes.ShowAllHospitalsFilter);
  }

  _clinicsFilterCallback() {
    Get.back();
    Get.toNamed(Routes.ShowAllClinicsFilter);
  }
}
