class PhoneNumber {
  int? id;
  String? phoneNumber;
  String? description;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? facibilityId;

  PhoneNumber(
      {this.id,
      this.phoneNumber,
      this.description,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.facibilityId});

  PhoneNumber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    description = json['description'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    facibilityId = json['facibility_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['facibility_id'] = this.facibilityId;
    return data;
  }
}
