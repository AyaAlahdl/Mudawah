class RegisterBody {
  String? rolId;
  String? name;
  String? email;
  String? password;
  String? avatar;
  RegisterBody({this.rolId, this.name, this.email, this.password, this.avatar});

  RegisterBody.fromJson(Map<String, dynamic> json) {
    rolId = json['role_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    //avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_id'] = this.rolId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['avatar'] = this.avatar;
    return data;
  }
}
