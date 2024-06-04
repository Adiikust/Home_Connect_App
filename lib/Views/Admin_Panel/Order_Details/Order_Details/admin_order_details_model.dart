class AdminOrderDetailsModel {
  String? success;
  List<Data>? data;

  AdminOrderDetailsModel({this.success, this.data});

  AdminOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? categoryIds;
  String? vendorTypeId;
  String? name;
  String? email;
  String? phone;
  String? city;
  String? area;
  List<String>? image;
  List<String>? video;
  String? choiceIds;
  String? surveyAdminId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? categoryId;
  String? subCategoryId;
  List<Showcases>? showcases;
  List<String>? vendorTypeName;

  Data(
      {this.id,
      this.userId,
      this.categoryIds,
      this.vendorTypeId,
      this.name,
      this.email,
      this.phone,
      this.city,
      this.area,
      this.image,
      this.video,
      this.choiceIds,
      this.surveyAdminId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.categoryId,
      this.subCategoryId,
      this.showcases,
      this.vendorTypeName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryIds = json['category_ids'];
    vendorTypeId = json['vendor_type_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    area = json['area'];
    image = json['image'].cast<String>();
    video = json['video'].cast<String>();
    choiceIds = json['choice_ids'];
    surveyAdminId = json['survey_admin_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    if (json['showcases'] != null) {
      showcases = <Showcases>[];
      json['showcases'].forEach((v) {
        showcases!.add(new Showcases.fromJson(v));
      });
    }
    vendorTypeName = json['vendor_type_name'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_ids'] = this.categoryIds;
    data['vendor_type_id'] = this.vendorTypeId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['area'] = this.area;
    data['image'] = this.image;
    data['video'] = this.video;
    data['choice_ids'] = this.choiceIds;
    data['survey_admin_id'] = this.surveyAdminId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    if (this.showcases != null) {
      data['showcases'] = this.showcases!.map((v) => v.toJson()).toList();
    }
    data['vendor_type_name'] = this.vendorTypeName;
    return data;
  }
}

class Showcases {
  int? id;
  String? name;
  String? description;
  List<String>? imageUrl;

  Showcases({this.id, this.name, this.description, this.imageUrl});

  Showcases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image_url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
