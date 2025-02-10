import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mudawah/views/file/file.dart';
import '../../others/functions/check_internet.dart';
import '../../utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  String token = AppCostants.kToken;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    };
  }
  updateToken(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    };
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? token}) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> updateData(String uri, dynamic body) async {
    try {
      Response response = await put(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<void> uploadImage(XFile imageFile) async {
    var request = http.MultipartRequest(
        'post', Uri.parse(AppCostants.BASE_URI + AppCostants.UPDATE_USER_URL));
    request.fields['avatar'];
    // request.headers = _mainHeaders;
    var picture = http.MultipartFile.fromBytes('image',
        (await rootBundle.load(imageFile.toString())).buffer.asUint8List());
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print('hello');
  }
}
