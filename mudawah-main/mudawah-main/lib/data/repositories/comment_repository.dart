import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mudawah/models/post.dart';
import 'package:mudawah/utils/app_constants.dart';

import '../../models/login_body.dart';
import '../api/api_client.dart';

class CommentRepo {
  final ApiClient apiClient;

  CommentRepo({required this.apiClient});

  Future<Response> AddComment(Comment comment) async {
    log('${comment.toJson()}');
    Response response = await apiClient.postData(
        AppCostants.ADD_NEW_COMMMENT, comment.toJson());
    return response;
  }
}
