import 'package:mudawah/models/post.dart';
import 'package:mudawah/models/user_models/phone_number.dart';
import 'package:mudawah/models/user_models/rate.dart';
import 'package:mudawah/models/user_models/specializition.dart';
import '../facibility_models/clinic.dart';

class Doctorr {
  var id;
  var roleId;
  var name;
  var email;
  var emailVerifiedAt;
  var avatar;
  var imgages;
  var description;
  var followers;
  var parentId;
  var createdAt;
  var updatedAt;
  var images;
  var seen;
  var specializitions;
  var clinics;
  List<Rates> rates = [];
  var posts;
  var rate_average;
  var phoneNumber;
  bool rated = false;

  Doctorr(
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
      this.updatedAt,
      this.images,
      this.seen,
      this.posts,
      this.rate_average});

  Doctorr.fromJson(Map<String, dynamic> json) {
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

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    images = json['images'];
    rate_average = json['rate_average'];
    if (json['specializitions'] != null) {
      specializitions = <Specializitions>[];
      json['specializitions'].forEach((v) {
        print('specia is   ${id}');
        specializitions!.add(new Specializitions.fromJson(v));
      });
    }
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(new Clinics.fromJson(v));
      });
    }
    if (json['rates'] != null) {
      rates = <Rates>[];
      json['rates'].forEach((v) {
        rates!.add(new Rates.fromJson(v));
      });
    }
    if (json['posts'] != null) {
      posts = <Post>[];
      json['posts'].forEach((v) {
        posts!.add(new Post.fromJson(v));
      });
    }
    if (json['phone_number'] != null) {
      posts = <PhoneNumber>[];
      json['phone_number'].forEach((v) {
        posts!.add(new PhoneNumber.fromJson(v));
      });
    }
    seen = json['seen'];
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

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['images'] = this.images;
    data['rate_average'] = this.rate_average;
    data['seen'] = this.seen;
    return data;
  }
}
