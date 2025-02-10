import 'dart:developer';

import 'package:get/get.dart';
import 'package:mudawah/data/repositories/comment_repository.dart';
import 'package:mudawah/data/repositories/hospital_repository.dart';
import 'package:mudawah/models/facibility_models/clinic.dart';
import 'package:mudawah/models/post.dart';
import 'package:mudawah/models/response_model.dart';
import 'package:mudawah/views/hospital/hospital.dart';

import '../models/facibility_models/hospital.dart';
import '../models/user_models/doctor.dart';

class HospitalController extends GetxController {
  HospitalRepo hospitalRepo;
  bool isLoaded = false;
  bool clinicsIsLoaded = false;
  bool hospitalsIsIsLoaded = false;
  List<HospitalJson> _hospitals = [];
  List<HospitalJson> _disHospitals = [];
  get disHospitalList => _disHospitals;
  get hospitalList => _hospitals;
  List<HospitalJson> _clinics = [];
  List<HospitalJson> _disClinics = [];
  get disClinicList => _disClinics;
  get clinicList => _clinics;

  List<HospitalJson> _hospitalClinics = [];
  get hospitalClinicsList => _hospitalClinics;

  List<Doctorr> _clinicDoctors = [];
  get clinicDoctorsList => _clinicDoctors;

  List<Doctorr> _hospitalDoctors = [];
  get hospitalDoctorsList => _hospitalDoctors;

  int clinicsHospitalLoaded = 0;

  HospitalController({required this.hospitalRepo});

  Future<void> getHospitalsData() async {
    Response response = await hospitalRepo.getHospitals();
    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      hospitalsIsIsLoaded = true;
      print('get hospital response : ${response.statusCode}');
      print('post get is : ${jsonData}');
      _hospitals = [];
      for (var item in jsonData) {
        var element = HospitalJson.fromJson(item);
        _hospitals.add(element);
      }
      _disHospitals = _hospitals;
    }
    update();
  }

  Future<void> getHospitalClinics(int hospitalId) async {
    clinicsHospitalLoaded = 1;
    Response response = await hospitalRepo.getCliicsByHospital(hospitalId);
    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      hospitalsIsIsLoaded = true;
      print('get hospitalClinics response : ${response.statusCode}');
      print('hospitalClinics get is : ${jsonData}');
      _hospitalClinics = [];
      for (var item in jsonData) {
        var element = HospitalJson.fromJson(item);
        _hospitalClinics.add(element);
      }
      print('hosptals are: ${_disHospitals.length.toString()}');
      clinicsHospitalLoaded = 2;
    }
    update();
  }

  Future<void> getClinicDoctors(int hospitalId) async {
    Response response = await hospitalRepo.getDoctorsByClinic(hospitalId);
    print('get ClininicDoctor response : ${response.statusCode}');

    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      hospitalsIsIsLoaded = true;
      print('post get is : ${jsonData}');
      _clinicDoctors = [];
      for (var item in jsonData) {
        var element = Doctorr.fromJson(item);
        _clinicDoctors.add(element);
      }
    }
    update();
  }

  Future<void> getHospitalDoctors(int hospitalId) async {
    Response response = await hospitalRepo.getDoctorsByHospital(hospitalId);
    print('get clinicDoctors response : ${response.statusCode}');

    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      hospitalsIsIsLoaded = true;
      print('clinicDoctors get is : ${jsonData}');
      _hospitalDoctors = [];
      for (var item in jsonData) {
        var element = Doctorr.fromJson(item);
        _hospitalDoctors.add(element);
      }
    }
    update();
  }

  Future<void> getAllClinicsData() async {
    Response response = await hospitalRepo.getAllClinics();
    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      clinicsIsLoaded = true;
      log('get clinics response : ${response.statusCode}');
      // print('post get is : ${jsonData}');
      _clinics = [];
      for (var item in jsonData) {
        var element = HospitalJson.fromJson(item);
        _clinics.add(element);
      }
      _disClinics = _clinics;
      print('hosptals are: ${_disHospitals.length.toString()}');
    }
    update();
  }

  searchHospitalListItems(String searchText) {
    _disHospitals = _hospitals
        .where((element) => element.name.contains(searchText))
        .toList();
    update();
  }

  searchClinicListItems(String searchText) {
    _disClinics =
        _clinics.where((element) => element.name.contains(searchText)).toList();
    update();
  }
}
