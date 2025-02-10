class LoginBody {
  String name;
  String password;

  LoginBody({required this.name, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.name;
    data['password'] = this.password;
    return data;
  }
}
