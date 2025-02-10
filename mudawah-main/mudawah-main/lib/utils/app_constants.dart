import '../models/User.dart';

class AppCostants {
  static User user = User();

  static String kToken = "";
  // Base Uri
  // static const String BASE_URI =
  //   "http://18.139.41.31/mudawa_api2/public/index.php";

  static const String BASE_URI = "http://157.175.33.26/mudawa_api2/public";

  // static const String GET_IMAGE_URL =
  //    "http://18.139.41.31/mudawa_api2/public/storage/";
  static const String GET_IMAGE_URL =
      "http://157.175.33.26/mudawa_api2/public/storage/";

  //end points
  static const String LOGIN_URL = "/api/usersV2/login";
  static const String REGIWTER_URL = "/api/usersV2/register";
  static const String GET_POSTS_URL = "/api/postsV2/posts";
  static const String UPDATE_USER_URL = "/api/usersV2/update";
  static const String UPDATE_PHONE_NUMBER = "/api/phoneV2/phone";
  static const String GET_ALL_USERS = "/api/doctorsV2/doctors-by-rate";
  static const String ADD_NEW_COMMMENT = "/api/comments/comment-add";
  static const String ADD_USER_PHONE = "/api/phoneV2/phone";
  static const String UPDATE_PASSWORD = "/api/usersV3/update-password";
  static const String GET_RECENT_POSTS = "/api/postsV2/posts-by-date";
  static const String UPDATE_POST_SEEN = "/api/postsV2/seen";
  static const String Add_POST_LIKE = "/api/postsV2/likes";
  static const String GET_DOCTOR_POSTS = "/api/postsV2/posts-by-doctor";
  static const String GET_DOCTOR_RATES = "/api/doctorsV2/doctor-rates";
  static const String ADD_NEW_POST = "/api/postsV2/posts";
  static const String GET_DIRECTORATES = "/api/locationV2/directorates-get";
  static const String GET_SPECIALLIZATION = "/api/specializitionV2";
  static const String GET_DOCTORS_FILTER = "/api/doctorsV2/doctors-filter";
  static const String ADD_NEW_RATE = "/api/rateV2/rate-add";
  static const String POSTS_BY_SEEN = "/api/postsV2/posts-by-seen";
  static const String GET_WORK_DAYS = "/api/clinicV2/get-doctor-clinic-workday";
  static const String GET_DOCTORS_BY_CLINIC =
      "/api/doctorsV2/doctors-by-clinic";
  static const String GET_DOCTORS_BY_HOSPITAL =
      "/api/doctorsV2/doctors-by-hospital";
  static const String GET_CLINICS_BY_DOCTOR =
      "/api/doctorsV2/clinics-by-doctor";
  static const String GET_CLINICS_BY_HOSPITAL =
      "/api/facilityV2/clinics-by-hospital";
  static const String UPDATE_APPOINTMENT_STATE =
      "/api/appointmentV2/appointment-state-update";
  static const String GET_USER_APPOINTMENTS =
      "/api/appointmentV2/appointments-by-user";
  static const String GET_DOCTOR_APPOINTMENTS =
      "/api/appointmentV2/appointments-by-doctor";
  static const String ADD_NEW_APPOINTMENT =
      "/api/appointmentV2/appointment-add";
  static const String GET_HOSPITALS_WITH_ALL_DATA =
      "/api/facilityV2/facility-hospitals";
  static const String GET_CLINICS_WITH_ALL_DATA =
      "/api/facilityV2/facility-clinics";
}
