import 'dart:developer';

import 'package:mudawah/utils/app_constants.dart';

import 'User.dart';

class Post {
  var id;
  var title;
  var content;
  var categoryId;
  var categoryName;
  var userId;
  var userName;

  var seen;
  var user;
  var createdAt;
  var image;
  List<Likes> likes = [];
  List<Comment> comments = [];
  bool userLiked = false;
  Post(
      {this.id,
      this.title,
      this.content,
      this.categoryId,
      this.categoryName,
      this.userId,
      this.userName,
      this.seen,
      this.user,
      this.createdAt,
      this.image});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    userId = json['user_id'];
    userName = json['user_name'];
    image = json['image'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
        if (v['user_id'] == AppCostants.user.id) {
          userLiked = true;
        }
      });
    }
    seen = json['seen'];
    if (json['user_data'] != null) {
      user = User.fromJson(json['user_data']);
    }
    createdAt = json['created_at'];
    if (json['comments'] != null) {
      comments = <Comment>[];
      json['comments'].forEach((v) {
        comments!.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['image'] = this.image;
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    data['seen'] = this.seen;
    return data;
  }
}

class Likes {
  int? id;
  int? postId;
  String? likeableType;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Likes(
      {this.id,
      this.postId,
      this.likeableType,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    likeableType = json['likeable_type'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['likeable_type'] = this.likeableType;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Comment {
  int? id;
  String? content;
  String? dateWritten;
  Null? votesUp;
  int? userId;
  int? postId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comment(
      {this.id,
      this.content,
      this.dateWritten,
      this.votesUp,
      this.userId,
      this.postId,
      this.createdAt,
      this.updatedAt});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    dateWritten = json['date_written'];
    votesUp = json['votes_up'];
    userId = json['user_id'];
    postId = json['post_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['date_written'] = this.dateWritten;
    data['votes_up'] = this.votesUp;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
