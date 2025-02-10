class AppointmentState {
  var id;
  var name;
  var code;

  AppointmentState({
    this.id,
    this.name,
    this.code,
  });

  AppointmentState.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
