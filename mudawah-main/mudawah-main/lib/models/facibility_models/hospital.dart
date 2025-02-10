import 'package:mudawah/models/User.dart';
import 'package:mudawah/models/doctor_model.dart';
import 'package:mudawah/models/facibility_models/Device.dart';

import '../post.dart';
import '../user_models/doctor.dart';
import '../user_models/phone_number.dart';
import 'clinic.dart';

class HospitalJson {
  var id;
  var name;
  var description;
  var ownerId;
  var address;
  var image;
  var bgImage;
  var parentId;
  var seen;
  var state;
  var phoneNumber;
  var clinics;
  var doctors;
  var devices;
  var posts;
  var type;
  var createdAt;
  var updatedAt;

  HospitalJson(
      {this.id,
      this.name,
      this.description,
      this.ownerId,
      this.address,
      this.image,
      this.bgImage,
      this.parentId,
      this.seen,
      this.state,
      this.phoneNumber,
      this.clinics,
      this.doctors,
      this.createdAt,
      this.updatedAt});

  HospitalJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    ownerId = json['owner_id'];
    address = json['address'];
    image = json['image'];
    bgImage = json['bg_image'];
    parentId = json['parent_id'];
    seen = json['seen'];
    state = json['state'];
    type = json['type'];
    if (json['phone_number'] != null) {
      phoneNumber = <PhoneNumber>[];
      json['phone_number'].forEach((v) {
        phoneNumber!.add(new PhoneNumber.fromJson(v));
      });
    }
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(new Clinics.fromJson(v));
      });
    }
    if (json['doctorss'] != null) {
      doctors = <Doctorr>[];
      json['doctorss'].forEach((v) {
        doctors!.add(new Doctorr.fromJson(v));
      });
      if (json['devices'] != null) {
        devices = <Device>[];
        json['devices'].forEach((v) {
          devices!.add(new Device.fromJson(v));
        });
      }
      if (json['posts'] != null) {
        posts = <Post>[];
        json['posts'].forEach((v) {
          posts!.add(new Post.fromJson(v));
        });
      }
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['description'] = this.description;
      data['owner_id'] = this.ownerId;
      data['address'] = this.address;
      data['image'] = this.image;
      data['bg_image'] = this.bgImage;
      data['parent_id'] = this.parentId;
      data['seen'] = this.seen;
      data['state'] = this.state;
      if (this.phoneNumber != null) {
        data['phone_number'] =
            this.phoneNumber!.map((v) => v.toJson()).toList();
      }
      if (this.clinics != null) {
        data['clinics'] = this.clinics!.map((v) => v.toJson()).toList();
      }
      if (this.doctors != null) {
        data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
      }
      if (this.devices != null) {
        data['devices'] = this.devices!.map((v) => v.toJson()).toList();
      }
      data['created_at'] = this.createdAt;
      data['updated_at'] = this.updatedAt;
      return data;
    }
  }
}
