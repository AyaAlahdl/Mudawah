class GetWorkDaysBody {
  var doctorId;
  var clinicId;
  GetWorkDaysBody({
    this.doctorId,
    this.clinicId,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['doctor_id'] = this.doctorId;
    map['clinic_id'] = this.clinicId;

    return map;
  }
}
