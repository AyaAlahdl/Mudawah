import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
import '../utils/app_constants.dart';

class PostsController extends GetxController {
  PostRepo postsRepo;
  bool isLoaded = false;
  int recentPostsIsLoaded = 0;
  int heightPostsIsLoaded = 0;
  bool recentPostIsLoaded = false;
  List<Post> _postsList = [];
  get postsList => _postsList;
  List<Post> _dispostsList = [];
  get dispostsList => _dispostsList;

  List<Post> _recentPostsList = [];
  get recentPostsList => _recentPostsList;
  List<Post> _disRecentPostsList = [];
  get disRecentPostsList => _disRecentPostsList;
  int sendPostLoaded = 0;

  PostsController({required this.postsRepo});

  Future<ResponseModel> sendPost(Post post) async {
    Response response = await postsRepo.sendPost(post);
    sendPostLoaded = 1;
    update();
    ResponseModel responseModel;
    print('post data is ${post.toJson()}');
    print('post send response : ${response.statusCode}');

    var jsonData = response.body;
    if (response.statusCode == 200 || response.statusCode == 201) {
      responseModel = ResponseModel(true, '');
      sendPostLoaded = 2;
      isLoaded = true;
      print('posts response : ${response.statusCode}');
    } else {
      responseModel = ResponseModel(false, '');
      sendPostLoaded = 3;
    }
    return responseModel;
    update();
  }

  Future<void> getPosts() async {
    Response response = await postsRepo.getPosts();
    heightPostsIsLoaded = 1;
    print('posts height response : ${response.statusCode}');

    if (response.statusCode == 200) {
      heightPostsIsLoaded = 2;
      isLoaded = true;
      log('height response posts get test ${response.body} ');
      var jsonData = response.body['data'];

      print('post height get is : ${jsonData}');
      _postsList = [];
      for (var item in jsonData) {
        print('hi in loop');
        var element = Post.fromJson(item);
        _postsList.add(element);
      }
      _dispostsList = _postsList;
      log('posts height lengths is ${_dispostsList.length}');
    }
    heightPostsIsLoaded = 3;

    update();
  }

  Future<void> getRecentPosts() async {
    Response response = await postsRepo.getRecentPosts();
    ResponseModel responseModel;
    recentPostsIsLoaded = 1;
    print('reecent response posts get test ${response.statusCode} ');

    var jsonData = response.body['data'];
    if (response.statusCode == 200) {
      recentPostIsLoaded;
      recentPostsIsLoaded = 2;
      print('reecent response posts get test ${response.body} ');
      print('posts response : ${response.statusCode}');
      print('post get is : ${jsonData}');
      _recentPostsList = [];
      for (var item in jsonData) {
        var element = Post.fromJson(item);
        _recentPostsList.add(element);
      }
      _disRecentPostsList = _recentPostsList;
    }
    update();
  }

  Future<void> updatePostSeen(UpdateSeenBody updateSeenBody) async {
    Response response = await postsRepo.updatePostSeen(updateSeenBody);
    ResponseModel responseModel;
    if (response.statusCode == 200) {}

    update();
  }

  Future<void> likePost(LikeBody likeBody) async {
    Response response = await postsRepo.likePost(likeBody);
    ResponseModel responseModel;
    print('response is:${response.statusCode}');
    log('response is:${response.statusCode}');
    if (response.statusCode == 200) {}
    update();
  }

  searchPostsHightListItems(String searchText) {
    _dispostsList = _postsList
        .where((element) => element.content!.contains(searchText))
        .toList();
    //print('dislist test${_disProductList.length}');
    update();
  }

  searchRecentPostsListItems(String searchText) {
    _disRecentPostsList = _recentPostsList
        .where((element) => element.content!.contains(searchText))
        .toList();
    //print('dislist test${_disProductList.length}');
    update();
  }
}
