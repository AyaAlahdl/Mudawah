import 'package:mudawah/models/user_models/doctor.dart';

class Specializitions {
  var id;
  var name;
  var desctiprion;
  var createdAt;
  var updatedAt;
  var doctors;

  Specializitions(
      {this.id,
      this.name,
      this.desctiprion,
      this.createdAt,
      this.updatedAt,
      this.doctors});

  Specializitions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desctiprion = json['desctiprion'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['doctors'] != null) {
      doctors = <Doctorr>[];
      json['doctors'].forEach((v) {
        doctors.add(new Doctorr.fromJson(v));
      });
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['desctiprion'] = this.desctiprion;
      data['created_at'] = this.createdAt;
      data['updated_at'] = this.updatedAt;

      return data;
    }
  }
}
