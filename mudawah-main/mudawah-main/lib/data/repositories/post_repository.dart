import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mudawah/models/post_models/like_body.dart';
import 'package:mudawah/models/post_models/update_seen_body.dart';
import 'package:mudawah/utils/app_constants.dart';

import '../../models/login_body.dart';
import '../../models/post.dart';
import '../api/api_client.dart';

class PostRepo {
  final ApiClient apiClient;

  PostRepo({required this.apiClient});
  Future<Response> sendPost(Post post) async {
    print('post repo is:  ${post.toJson().toString()}');
    Response response =
        await apiClient.postData(AppCostants.ADD_NEW_POST, post.toJson());
    return response;
  }

  Future<Response> getPosts() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.getData(AppCostants.POSTS_BY_SEEN);
    print('posts height repo response ${response.statusCode}');
    return response;
  }

  Future<Response> getRecentPosts() async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.getData(AppCostants.GET_RECENT_POSTS);
    return response;
  }

  Future<Response> updatePostSeen(UpdateSeenBody updateSeenBody) async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    Response response = await apiClient.postData(
        AppCostants.UPDATE_POST_SEEN, updateSeenBody.toJson());
    print('repsonse post is : ${response.statusCode}');
    return response;
  }

  Future<Response> likePost(LikeBody likeBody) async {
    // Response response =
    //     await apiClient.postData(AppCostants.LOGIN_URL, loginBody.toJson());
    print(likeBody.toJson());
    Response response =
        await apiClient.postData(AppCostants.Add_POST_LIKE, likeBody.toJson());
    print('repsonse post is : ${response.statusCode}');
    return response;
  }
}
