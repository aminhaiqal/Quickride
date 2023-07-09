class Vehicle {
  String? id;
  String? name;
  String? model;
  String? color;
  String? plateNumber;
  String? type;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  Vehicle(
      {this.id,
      this.name,
      this.model,
      this.color,
      this.plateNumber,
      this.type,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    model = json['model'];
    color = json['color'];
    plateNumber = json['plate_number'];
    type = json['type'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}