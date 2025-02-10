class Directorate {
  var id;
  var name;
  var code;
  var city_id;

  Directorate({this.id, this.name, this.code, this.city_id});

  Directorate.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.code = map['id'];
    this.city_id = map['city_id'];
  }
}
