import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mudawah/data/repositories/doctor_repository.dart';
import 'package:mudawah/data/repositories/user_repository.dart';
import 'package:mudawah/models/user_models/rate.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../components/show_custom_snackbar.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/post_repository.dart';
import '../models/User.dart';
import '../models/facibility_models/hospital.dart';
import '../models/login_body.dart';
import '../models/post.dart';
import '../models/posts.dart';
import '../models/response_model.dart';
import '../models/user_models/add_doctor_rate_body.dart';
import '../models/user_models/doctor.dart';
import '../utils/app_constants.dart';

class DoctorController extends GetxController {
  DoctorRepo doctorRepo;
  bool isLoaded = false;
  bool doctorsIsLoaded = false;
  int addRateLoaded = 0;
  List<Doctorr> _doctorsList = [];
  get doctorsList => _doctorsList;
  List<Doctorr> _disDoctorsList = [];
  get disDoctorsList => _disDoctorsList;
  List<Post> _doctorPosts = [];
  List<Post> disDoctorPosts = [];
  //get disDoctorPosts => _disDoctorPosts;
  //doctor rates related
  List<Rates> _doctorRates = [];
  List<Rates> _disDoctorRates = [];
  get disDoctorRates => _disDoctorRates;
  var rateAverage = 0.0;
  int doctorClinicsIsLoaded = 0;
  List<HospitalJson> _doctorClinics = [];
  get doctorClinicsList => _doctorClinics;

  //doctor related
  //List<Doctorr> _disDoctorsList = [];
  //get disDoctorsList => _disDoctorsList;

  DoctorController({required this.doctorRepo});

  Future<void> getDoctors() async {
    Response response = await doctorRepo.getDoctors();
    ResponseModel responseModel;
    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      doctorsIsLoaded = true;
      print('user response : ${response.statusCode}');
      log('user get is : ${jsonData}');
      _doctorsList = [];
      for (var item in jsonData) {
        var element = Doctorr.fromJson(item);
        _doctorsList.add(element);
        print('getting users test othman ${element.name}');
      }
      _disDoctorsList = _doctorsList;
      print('doctors are: ${_disDoctorsList.length}');
      //print('lengthoo ${_doctors.length}');

      // getDoctorsList();
    }
    update();
  }

  Future<void> getDoctorPosts(int doctorId) async {
    Response response = await doctorRepo.getDoctorPosts(doctorId);
    ResponseModel responseModel;
    print('doctorPosts get  response : ${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonData = response.body['data'];

      print('doctorPosts response : ${response.statusCode}');
      print('doctorPosts get is : ${jsonData}');
      _doctorPosts = [];
      disDoctorPosts = [];
      if (jsonData != null) {
        for (var item in jsonData) {
          var element = Post.fromJson(item);
          _doctorPosts.add(element);
        }
        disDoctorPosts = _doctorPosts;
      }
    }
    update();
  }

  Future<void> getDoctorRates(int doctorId) async {
    Response response = await doctorRepo.getDoctorPosts(doctorId);
    ResponseModel responseModel;
    print('doctorPosts response : ${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonData = response.body['data'];

      print('doctorPosts response : ${response.statusCode}');

      _doctorRates = [];
      if (jsonData != null) {
        for (var item in jsonData) {
          var element = Rates.fromJson(item);
          _doctorRates.add(element);
        }
        _disDoctorRates = _doctorRates;
      }
    }
    update();
  }

  Future<void> getClinicByDoctors(int doctorId) async {
    Response response = await doctorRepo.getClinicsByDoctor(doctorId);
    print('get ClininicDoctor response : ${response.statusCode}');
    doctorClinicsIsLoaded = 1;

    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      print('post get is : ${jsonData}');
      doctorClinicsIsLoaded = 2;
      _doctorClinics = [];
      for (var item in jsonData) {
        var element = HospitalJson.fromJson(item);
        _doctorClinics.add(element);
      }
    }
    update();
  }

  Future<double> addNewRate(AddRateBody addRateBody) async {
    addRateLoaded = 1;
    Response response = await doctorRepo.addNewRate(addRateBody);
    print('doctorPosts response : ${response.statusCode}');
    print('rate body  : ${addRateBody.toJson().toString()}');

    if (response.statusCode == 200) {
      addRateLoaded = 2;
      rateAverage = double.parse(response.body);

      print('rate aveg is : ${response.statusCode}');
      print('rate aveg is : ${rateAverage}');

      print('doctorPosts response : ${response.statusCode}');
    } else {
      addRateLoaded = 3;
    }
    update();
    return rateAverage;
  }

  /* getDoctorsList() {
    _disDoctorsList = _usersList.where((user) => user.roleId == 2).toList();
    print('dis length is : ${_disDoctorsList.length}');
  }*/

  searchFilterListItems(String searchText) {
    _disDoctorsList = _doctorsList
        .where((element) => element.name!.contains(searchText))
        .toList();
    //print('dislist test${_disProductList.length}');
    update();
  }

  bool checkIfAlreadyRated() {
    bool rated = false;
    _disDoctorRates.forEach((element) {
      if (AppCostants.user.id == element.user.id) {
        rated = true;
      }
    });
    return rated;
  }

  searchDoctorListItems(String searchText) {
    _disDoctorsList = _doctorsList
        .where((element) => element.name.contains(searchText))
        .toList();
    update();
  }
}
