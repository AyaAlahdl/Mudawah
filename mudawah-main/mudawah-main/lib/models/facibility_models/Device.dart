class Device {
  int? id;
  String? name;
  String? model;
  String? description;
  int? parentId;
  int? price;
  String? createdAt;
  String? updatedAt;
  String? image;

  Device(
      {this.id,
      this.name,
      this.model,
      this.description,
      this.parentId,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.image});

  Device.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    model = json['model'];
    description = json['description'];
    parentId = json['parent_id'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['model'] = this.model;
    data['description'] = this.description;
    data['parent_id'] = this.parentId;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    return data;
  }
}
