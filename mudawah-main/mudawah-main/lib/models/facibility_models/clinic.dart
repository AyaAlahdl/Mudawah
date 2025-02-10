import 'package:mudawah/models/User.dart';
import 'package:mudawah/models/facibility_models/work_day.dart';

import '../user_models/doctor.dart';
import '../user_models/phone_number.dart';

class Clinics {
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
  var doctors;
  var createdAt;
  var updatedAt;
  var workDays;

  Clinics(
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
      this.doctors,
      this.createdAt,
      this.updatedAt});

  Clinics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['description'] != null) {
      description = json['description'];
    }
    if (json['owner_id'] != null) {
      ownerId = json['owner_id'];
    }
    if (json['address'] != null) {
      address = json['address'];
    }

    if (json['image'] != null) {
      image = json['image'];
    }
    if (json['bg_image'] != null) {
      bgImage = json['bg_image'];
    }
    if (json['parent_id'] != null) {
      parentId = json['parent_id'];
    }
    if (json['seen'] != null) {
      seen = json['seen'];
    }
    if (json['state'] != null) {
      state = json['state'];
    }
    if (json['phone_number'] != null) {
      phoneNumber = <PhoneNumber>[];
      json['phone_number'].forEach((v) {
        phoneNumber!.add(new PhoneNumber.fromJson(v));
      });
    }
    if (json['doctors'] != null) {
      doctors = <Doctorr>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctorr.fromJson(v));
      });
    }
    if (json['work_days'] != null) {
      workDays = <WorkDays>[];
      json['work_days'].forEach((v) {
        workDays!.add(new WorkDays.fromJson(v));
      });
    }
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
      data['phone_number'] = this.phoneNumber!.map((v) => v.toJson()).toList();
    }
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
