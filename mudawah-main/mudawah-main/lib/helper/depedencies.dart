import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mudawah/controllers/appointmentController.dart';
import 'package:mudawah/controllers/auth_controller.dart';
import 'package:mudawah/controllers/comment_controller.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/controllers/filter_controller.dart';
import 'package:mudawah/controllers/hospital_controller.dart';
import 'package:mudawah/controllers/location_controller.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/data/api/api_client.dart';
import 'package:mudawah/data/repositories/appointment_repository.dart';
import 'package:mudawah/data/repositories/auth_repository.dart';
import 'package:mudawah/data/repositories/comment_repository.dart';
import 'package:mudawah/data/repositories/doctor_repository.dart';
import 'package:mudawah/data/repositories/filter_repository.dart';
import 'package:mudawah/data/repositories/hospital_repository.dart';
import 'package:mudawah/data/repositories/location_repository.dart';
import 'package:mudawah/data/repositories/user_repository.dart';
import 'package:mudawah/others/middlewares/auth_middleware.dart';
import 'package:mudawah/utils/app_constants.dart';

import '../data/api/api_client.dart';
import '../controllers/post_controller.dart';
import '../data/repositories/post_repository.dart';

var storage = GetStorage();

Future<void> init() async {
  GetStorage.init();
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppCostants.BASE_URI));
  //repositories
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));
  Get.lazyPut(() => PostRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserRepository(apiClient: Get.find()));
  Get.lazyPut(() => CommentRepo(apiClient: Get.find()));
  Get.lazyPut(() => HospitalRepo(apiClient: Get.find()));
  Get.lazyPut(() => DoctorRepo(apiClient: Get.find()));
  Get.lazyPut(() => AppointmentRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find()));
  Get.lazyPut(() => FilterRepo(apiClient: Get.find()));
  //controllers
  Get.put(AuthController(authRepo: Get.find()));
  Get.put(PostsController(postsRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => CommentController(commentRepo: Get.find()));
  Get.lazyPut(() => HospitalController(hospitalRepo: Get.find()));
  Get.lazyPut(() => DoctorController(doctorRepo: Get.find()));
  Get.lazyPut(() => AppointmentController(appointmentRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => FilterController(filterRepo: Get.find()));

  //middlewares
  Get.put(AuthMiddleware());
}
