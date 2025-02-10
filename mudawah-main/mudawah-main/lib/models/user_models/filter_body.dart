class FilterBody {
  var locationId;
  var SpecId;
  var type;

  FilterBody({this.locationId, this.SpecId, this.type});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['location_id'] = this.locationId;
    map['spec_id'] = this.SpecId;
    map['type'] = this.type;

    return map;
  }
}
