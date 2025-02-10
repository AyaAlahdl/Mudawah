class WorkDays {
  int? id;
  String? name;
  String? code;
  var periods;
  //List<DoctorClinic>? doctorClinic;

  WorkDays({this.id, this.name, this.code, this.periods});

  WorkDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(new Periods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    if (this.periods != null) {
      data['periods'] = this.periods!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Periods {
  int? id;
  String? name;
  String? fromTime;
  String? toTime;
  String? createdAt;
  String? updatedAt;

  Periods({
    this.id,
    this.name,
    this.fromTime,
    this.toTime,
    this.createdAt,
    this.updatedAt,
  });

  Periods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}
