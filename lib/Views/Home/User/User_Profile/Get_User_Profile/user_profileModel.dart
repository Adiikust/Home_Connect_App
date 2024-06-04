class UserProfileDataModel {
  bool? success;
  Data? data;

  UserProfileDataModel({this.success, this.data});

  UserProfileDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? city;
  String? address;
  String? area;
  String? imageUrl;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.city,
      this.address,
      this.area,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    city = json['city'];
    address = json['address'];
    area = json['area'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['city'] = this.city;
    data['address'] = this.address;
    data['area'] = this.area;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
