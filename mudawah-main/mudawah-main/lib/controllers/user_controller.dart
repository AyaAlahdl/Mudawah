import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mudawah/data/repositories/user_repository.dart';
import 'package:mudawah/models/facibility_models/work_day.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../components/show_custom_snackbar.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/post_repository.dart';
import '../models/User.dart';
import '../models/login_body.dart';
import '../models/post.dart';
import '../models/posts.dart';
import '../models/response_model.dart';
import '../models/user_models/doctor.dart';

class UserController extends GetxController {
  UserRepository userRepo;
  bool isLoaded = false;
  List<Doctorr> _usersList = [];
  get usersList => _usersList;
  List<Doctorr> _disUsersList = [];
  get disUsersList => _disUsersList;

  //doctor related
  List<Doctorr> _disDoctorsList = [];
  get disDoctorsList => _disDoctorsList;

  UserController({required this.userRepo});

  Future<void> getUsers() async {
    Response response = await userRepo.getUsers();
    ResponseModel responseModel;
    print('user response : ${response.statusCode}');

    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      print('user get is : ${jsonData}');
      _usersList = [];
      for (var item in jsonData) {
        var element = Doctorr.fromJson(item);
        _usersList.add(element);
        print('getting users test othman ${element.name}');
      }

      _disUsersList = _usersList;
      print('lengthoo ${_disUsersList.length}');

      getDoctorsList();
    }
    update();
  }

  getDoctorsList() {
    _disDoctorsList = _usersList.where((user) => user.roleId == 5).toList();
    print('dis length is : ${_disDoctorsList.length}');
  }
//temp delete work days without periods

  searchFilterListItems(String searchText) {
    _disUsersList = _usersList
        .where((element) => element.name!.contains(searchText))
        .toList();
    //print('dislist test${_disProductList.length}');
    update();
  }
}
