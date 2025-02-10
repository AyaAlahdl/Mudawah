import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mudawah/data/repositories/appointment_repository.dart';
import 'package:mudawah/data/repositories/location_repository.dart';
import 'package:mudawah/models/appointment_models/appointment.dart';
import 'package:mudawah/models/location_model/directorate_model.dart';
import 'package:mudawah/models/post_models/like_body.dart';
import 'package:mudawah/models/post_models/update_seen_body.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../components/show_custom_snackbar.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/post_repository.dart';
import '../models/User.dart';
import '../models/login_body.dart';
import '../models/post.dart';
import '../models/posts.dart';
import '../models/response_model.dart';

class LocationController extends GetxController {
  LocationRepo locationRepo;
  bool isLoaded = false;
  List<Directorate> _directoratesList = [];
  get directoratesList => _directoratesList;

  List<Directorate> _disDirectoratesList = [];
  get disDirectoratesList => _disDirectoratesList;

  LocationController({required this.locationRepo});

  Future<void> getDirectorates() async {
    Response response = await locationRepo.getDirectorates();
    ResponseModel responseModel;
    var jsonData = response.body;
    print('response location is ${response.statusCode}');
    if (response.statusCode == 200) {
      _directoratesList = [];
      for (var item in jsonData) {
        var element = Directorate.fromJson(item);
        _directoratesList.add(element);
      }
      _disDirectoratesList = _directoratesList;
      print('appointments are${_disDirectoratesList.length}');
    }
  }
}
