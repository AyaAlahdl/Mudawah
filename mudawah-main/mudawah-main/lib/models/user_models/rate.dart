import '../User.dart';

class Rates {
  var id;
  var user;
  var doctor;
  var clinic;
  var starsNumber;
  var comment;

  Rates(
      {this.id,
      this.user,
      this.doctor,
      this.clinic,
      this.starsNumber,
      this.comment});

  Rates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    doctor = json['doctor'];
    clinic = json['clinic'];
    starsNumber = json['stars_number'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['doctor'] = this.doctor;
    data['clinic'] = this.clinic;
    data['stars_number'] = this.starsNumber;
    data['comment'] = this.comment;
    return data;
  }
}
