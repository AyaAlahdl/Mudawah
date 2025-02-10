import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mudawah/colors.dart';
import 'package:mudawah/controllers/appointmentController.dart';
import 'package:mudawah/controllers/doctor_controller.dart';
import 'package:mudawah/controllers/filter_controller.dart';
import 'package:mudawah/controllers/hospital_controller.dart';
import 'package:mudawah/controllers/location_controller.dart';
import 'package:mudawah/controllers/post_controller.dart';
import 'package:mudawah/controllers/user_controller.dart';
import 'package:mudawah/others/routes/routes.dart';
import 'package:mudawah/views/SignUp/signup.dart';
import 'package:mudawah/views/Home/HomePage.dart';
import 'package:mudawah/views/SignUp/signup.dart';
import 'package:mudawah/views/account/account.dart';
import 'package:mudawah/views/accountSettings/settings1.dart';
import 'package:mudawah/views/accountSettings/settings2.dart';
import 'package:mudawah/views/appointment/SecoundRoute.dart';
import 'package:mudawah/views/blogs/blog1.dart';
import 'package:mudawah/views/file/file.dart';
import 'package:mudawah/views/loginSys/Forgot_password_reset.dart';
import 'package:mudawah/views/loginSys/forgot_password1.dart';
import 'package:mudawah/views/loginSys/forgot_password2.dart';
import 'package:mudawah/views/search/search.dart';
import 'package:mudawah/views/splash/splash_screen.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'components/bottom_navigations.dart';
import 'views/OnBoarding.dart';
import 'views/accountSettings/settings1.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mudawah/helper/depedencies.dart' as dep;
import 'package:mudawah/views/blogs/blog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<UserController>().getUsers();
    Get.find<DoctorController>().getDoctors();
    Get.find<LocationController>().getDirectorates();
    Get.find<FilterController>().getSpecs();
    Get.find<AppointmentController>().getUserAppointments();
    Get.find<AppointmentController>().getDoctorAppointments();
    Get.find<HospitalController>().getHospitalsData();
    Get.find<HospitalController>().getAllClinicsData();
    Get.find<PostsController>().getRecentPosts();
    Get.find<PostsController>().getPosts();
    return GetMaterialApp(
      getPages: routes(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SplashScreen,
      //home: SecondRoute(),
      theme: ThemeData(
        primaryColor: primeteilcolor,
        textTheme: PersianFonts.vazirTextTheme,
      ),
      //home: BottomNavigations(),
    );
  }
}
