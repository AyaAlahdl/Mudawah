class UpdatePhoneBody {
  String? oldPhoneNumber;
  String? phoneNumber;

  UpdatePhoneBody({this.oldPhoneNumber, this.phoneNumber});

  UpdatePhoneBody.fromJson(Map<String, dynamic> json) {
    oldPhoneNumber = json['old_phone_number'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['old_phone_number'] = this.oldPhoneNumber;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
