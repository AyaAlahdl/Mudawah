class AddRateBody {
  int? doctorId;
  int? clinicId;
  double? starsNumber;
  String? comment;

  AddRateBody({this.doctorId, this.clinicId, this.starsNumber, this.comment});

  AddRateBody.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    clinicId = json['clinic_id'];
    starsNumber = json['stars_number'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['clinic_id'] = this.clinicId;
    data['stars_number'] = this.starsNumber;
    data['comment'] = this.comment;
    return data;
  }
}
