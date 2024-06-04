class VendorListingSubCategoriesIdModel {
  bool? success;
  List<Data>? data;

  VendorListingSubCategoriesIdModel({this.success, this.data});

  VendorListingSubCategoriesIdModel.fromJson(Map<String, dynamic> json) {
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
  int? price;
  String? description;
  String? categoryId;
  String? subCategoryId;
  List<String>? imageUrl;

  Data(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.categoryId,
      this.subCategoryId,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    imageUrl = json['image_url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
