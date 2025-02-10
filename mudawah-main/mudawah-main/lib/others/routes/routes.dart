import 'package:get/get.dart';
import 'package:mudawah/components/bottom_navigations.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/others/middlewares/onboarding_middleware.dart';
import 'package:mudawah/views/Schedule/scadual_screen.dart';
import 'package:mudawah/views/SignUp/signup.dart';
import 'package:mudawah/views/splash/splash_screen.dart';

import '../../views/Articles/article.dart';
import '../../views/Doctor/DoctorProfile.dart';
import '../../views/Doctor/widgets/BlogPost.dart';
import '../../views/Home/filter_screens/showAllDoctorsInCategory.dart';
import '../../views/Home/filter_screens/show_all_clinics_filter.dart';
import '../../views/Home/filter_screens/show_all_hospital_filter.dart';
import '../../views/Home/show_all/screens/showAll_clinics.dart';
import '../../views/Home/show_all/screens/showAllDoctorsInCategory.dart';
import '../../views/Home/show_all/screens/show_all_posts_heigh.dart';
import '../../views/Home/show_all/screens/show_all_posts_news.dart';
import '../../views/OnBoarding.dart';
import '../../views/Schedule/doctor_book_detail.dart';
import '../../views/Schedule/myschedule.dart';
import '../../views/appointment/SecoundRoute.dart';
import '../../views/appointment/appointment.dart';
import '../../views/blogs/blog1.dart';
import '../../views/file/mybooking.dart';
import '../../views/hospital/clinic_profile.dart';
import '../../views/hospital/components/doctortab.dart';
import '../../views/hospital/hospital.dart';
import '../../views/loginSys/login_screen/login_screen.dart';
import '../middlewares/auth_middleware.dart';

routes() => [
      GetPage(name: Routes.SplashScreen, page: () => SplashScreen()),
      GetPage(name: Routes.bottomNavations, page: () => BottomNavigations()),
      GetPage(
          name: Routes.loginScreen1,
          page: () => LoginScreen1(),
          middlewares: [AuthMiddleware()]),
      GetPage(name: Routes.bottomNavations, page: () => BottomNavigations()),
      GetPage(name: Routes.signupScreen, page: () => SignupScreen()),
      GetPage(name: Routes.article, page: () => Article()),
      GetPage(name: Routes.doctorPf, page: () => DoctorProfile()),
      //GetPage(name: Routes.blogPost, page: () => BlogPost()),
      GetPage(name: Routes.doctorTab, page: () => DoctorTab()),
      GetPage(name: Routes.hospital, page: () => Hospital()),
      GetPage(name: Routes.myBlog1, page: () => MyBlog1()),
      GetPage(name: Routes.appointment, page: () => appointment()),
      GetPage(
          name: Routes.filterDoctorCategory,
          page: () => FilterDoctorCategory()),
      GetPage(
          name: Routes.showAllDoctorCategory,
          page: () => ShowAllDoctorCategory()),
      GetPage(name: Routes.scadualScreen, page: () => ScadualScreen()),
      GetPage(name: Routes.SignupScreen, page: () => SignupScreen()),
      GetPage(name: Routes.mybooking, page: () => mybooking()),
      GetPage(name: Routes.SecondRoute, page: () => SecondRoute()),
      GetPage(name: Routes.ShowAllClinics, page: () => ShowAllClinics()),
      GetPage(
          name: Routes.ShowAllHospitalsFilter,
          page: () => ShowAllHospitalsFilter()),
      GetPage(
          name: Routes.ShowAllClinicsFilter,
          page: () => ShowAllClinicsFilter()),
      GetPage(
          name: Routes.ShowAllPostsNewsCategory,
          page: () => ShowAllPostsNewsCategory()),
      GetPage(
          name: Routes.ShowAllPostsHeightCategory,
          page: () => ShowAllPostsHeightCategory()),
      GetPage(name: Routes.clinicProfile, page: () => ClinicProfile()),
      GetPage(
          name: Routes.doctorBookingDetail, page: () => DoctorBookingDetail()),
      GetPage(name: Routes.bookingschedule, page: () => bookingschedule()),
      GetPage(
          name: Routes.onBoarding,
          page: () => OnBoarding(),
          middlewares: [OnbaordingMiddleware()]),
    ];

class Routes {
  static const SplashScreen = '/SplashScreen';
  static const clinicProfile = '/ClinicProfile';
  static const bottomNavations = '/BottomNavigations';
  static const loginScreen1 = '/LoginScreen1';
  static const bottomNavigations = '/BottomNavigations';
  static const signupScreen = '/SignupScreen';
  static const article = '/Article';
  static const doctorPf = '/DoctorPf';
  //static const blogPost = '/BlogPost';
  static const onBoarding = '/OnBoarding';
  static const doctorTab = '/DoctorTab';
  static const hospital = '/Hospital';
  static const appointment = '/appointment';
  static const mybooking = '/mybooking';
  static const showAllDoctorCategory = '/ShowAllDoctorCategory';
  static const filterDoctorCategory = '/FilterDoctorCategory';
  static const myBlog1 = '/MyBlog1';
  static const bookingschedule = '/bookingschedule';
  static const Sign = '/Sign';
  static const SignupScreen = '/SignupScreen';
  static const scadualScreen = '/ScadualScreen';
  static const doctorBookingDetail = '/DoctorBookingDetail';
  static const ShowAllPostsHeightCategory = '/ShowAllPostsHeightCategory';
  static const SecondRoute = '/SecondRoute';
  static const ShowAllClinics = '/ShowAllClinics';
  static const ShowAllPostsNewsCategory = '/ShowAllPostsNewsCategory';
  static const ShowAllHospitalsFilter = '/ShowAllHospitalsFilter';
  static const ShowAllClinicsFilter = '/ShowAllClinicsFilter';
}
