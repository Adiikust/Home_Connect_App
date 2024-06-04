class VendorProfileDataModel {
  bool? success;
  Data? data;

  VendorProfileDataModel({this.success, this.data});

  VendorProfileDataModel.fromJson(Map<String, dynamic> json) {
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
  String? fName;
  String? lName;
  String? email;
  List<Restaurants>? restaurants;
  String? imageUrl;

  Data(
      {this.id,
      this.name,
      this.fName,
      this.lName,
      this.email,
      this.restaurants,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(new Restaurants.fromJson(v));
      });
    }
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Restaurants {
  String? address;
  String? phone;

  Restaurants({this.address, this.phone});

  Restaurants.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }
}
