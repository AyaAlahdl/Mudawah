import 'package:mudawah/models/user_models/phone_number.dart';
import 'package:mudawah/models/user_models/specializition.dart';

import 'facibility_models/clinic.dart';

class UserModel {
  String? token;
  User? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  var roleId;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? avatar;
  String? imgages;
  String? description;
  int? followers;
  int? parentId;
  int? active;
  // Settings? settings;
  String? createdAt;
  String? updatedAt;
  List<PhoneNumber> phoneNumber = [];

  User(
      {this.id,
      this.roleId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.avatar,
      this.imgages,
      this.description,
      this.followers,
      this.parentId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    avatar = json['avatar'];
    imgages = json['imgages'];
    description = json['description'];
    followers = json['followers'];
    parentId = json['parent_id'];
    active = json['active'];

    if (json['phone_number'] != null) {
      //phoneNumber.add  PhoneNumber.fromJson(json['phone_number']);
      phoneNumber = <PhoneNumber>[];
      json['phone_number'].forEach((v) {
        phoneNumber.add(new PhoneNumber.fromJson(v));
      });
    }

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['avatar'] = this.avatar;
    data['imgages'] = this.imgages;
    data['description'] = this.description;
    data['followers'] = this.followers;
    data['parent_id'] = this.parentId;
    if (this.phoneNumber != null) {
      data['phone_number'] = this.phoneNumber!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



// class Settings {
//   String? locale;

//   Settings({this.locale});

//   Settings.fromJson(Map<String, dynamic> json) {
//     locale = json['locale'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['locale'] = this.locale;
//     return data;
//   }
// }
