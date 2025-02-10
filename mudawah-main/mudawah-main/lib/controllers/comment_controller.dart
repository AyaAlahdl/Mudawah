import 'dart:developer';

import 'package:get/get.dart';
import 'package:mudawah/data/repositories/comment_repository.dart';
import 'package:mudawah/models/post.dart';
import 'package:mudawah/models/response_model.dart';

class CommentController extends GetxController {
  CommentRepo commentRepo;
  CommentController({required this.commentRepo});

  Future<ResponseModel> addNewComment(Comment comment) async {
    Response response = await commentRepo.AddComment(comment);
    var jsonData = response.body;
    print('add comment response is: ${response.statusCode}');
    log('add comment response is: ${response.statusCode}');
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, jsonData['res']);
    } else {
      responseModel = ResponseModel(false, '');
    }
    return responseModel;
  }
}
