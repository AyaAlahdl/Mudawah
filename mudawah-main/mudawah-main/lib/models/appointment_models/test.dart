class Test {
  var id;
  var name;
  Test.fromJson(Map<String, dynamic> map) {
    id = map['id'];
  }
}
