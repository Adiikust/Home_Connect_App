class VendorShowCaseModel {
  bool? success;
  List<Data>? data;

  VendorShowCaseModel({this.success, this.data});

  VendorShowCaseModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? categoryId;
  String? subCategoryId;
  String? description;
  List<String>? imageUrl;

  Data(
      {this.id,
      this.name,
      this.categoryId,
      this.subCategoryId,
      this.description,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    description = json['description'];
    imageUrl = json['image_url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
