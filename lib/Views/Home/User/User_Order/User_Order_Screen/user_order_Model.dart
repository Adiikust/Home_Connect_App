class UserOrderDataModel {
  UserOrderDataModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;

  UserOrderDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.inquiry,
    required this.survey,
    required this.vendors,
  });
  late final String id;
  late final Inquiry inquiry;
  late final Survey survey;
  late final List<Vendors> vendors;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inquiry = Inquiry.fromJson(json['inquiry']);
    survey = Survey.fromJson(json['survey']);
    vendors =
        List.from(json['vendors']).map((e) => Vendors.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['inquiry'] = inquiry.toJson();
    _data['survey'] = survey.toJson();
    _data['vendors'] = vendors.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Inquiry {
  Inquiry({
    required this.id,
    required this.userId,
    required this.categoryIds,
    required this.vendorTypeId,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.area,
    required this.image,
    required this.video,
    required this.choiceIds,
    required this.surveyAdminId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.showcases,
  });
  late final int id;
  late final String userId;
  late final String categoryIds;
  late final String vendorTypeId;
  late final String name;
  late final String email;
  late final String phone;
  late final String city;
  late final String area;
  late final List<String> image;
  late final List<String> video;
  late final String choiceIds;
  late final String surveyAdminId;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final List<Showcases> showcases;

  Inquiry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryIds = json['category_ids'];
    vendorTypeId = json['vendor_type_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    area = json['area'];
    image = List.castFrom<dynamic, String>(json['image']);
    video = List.castFrom<dynamic, String>(json['video']);
    choiceIds = json['choice_ids'];
    surveyAdminId = json['survey_admin_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    showcases =
        List.from(json['showcases']).map((e) => Showcases.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['category_ids'] = categoryIds;
    _data['vendor_type_id'] = vendorTypeId;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['city'] = city;
    _data['area'] = area;
    _data['image'] = image;
    _data['video'] = video;
    _data['choice_ids'] = choiceIds;
    _data['survey_admin_id'] = surveyAdminId;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['showcases'] = showcases.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Showcases {
  Showcases({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  late final int id;
  late final String name;
  late final String description;
  late final List<String> imageUrl;

  Showcases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = List.castFrom<dynamic, String>(json['image_url']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class Survey {
  Survey({
    required this.id,
    required this.userId,
    required this.categoryIds,
    required this.vendorTypeId,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.area,
    required this.image,
    required this.video,
    required this.choiceIds,
    required this.dispatcherId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.inquiryId,
    required this.inquiryDate,
  });
  late final int id;
  late final String userId;
  late final String categoryIds;
  late final String vendorTypeId;
  late final String name;
  late final String email;
  late final String phone;
  late final String city;
  late final String area;
  late final List<String> image;
  late final List<String> video;
  late final String choiceIds;
  late final String dispatcherId;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String inquiryId;
  late final String inquiryDate;

  Survey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryIds = json['category_ids'];
    vendorTypeId = json['vendor_type_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    area = json['area'];
    image = List.castFrom<dynamic, String>(json['image']);
    video = List.castFrom<dynamic, String>(json['video']);
    choiceIds = json['choice_ids'];
    dispatcherId = json['dispatcher_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inquiryId = json['inquiry_id'];
    inquiryDate = json['inquiry_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['category_ids'] = categoryIds;
    _data['vendor_type_id'] = vendorTypeId;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['city'] = city;
    _data['area'] = area;
    _data['image'] = image;
    _data['video'] = video;
    _data['choice_ids'] = choiceIds;
    _data['dispatcher_id'] = dispatcherId;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['inquiry_id'] = inquiryId;
    _data['inquiry_date'] = inquiryDate;
    return _data;
  }
}

class Vendors {
  Vendors({
    required this.id,
    required this.name,
    required this.activities,
  });
  late final int id;
  late final String name;
  late final List<Activities> activities;

  Vendors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    activities = List.from(json['activities'])
        .map((e) => Activities.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['activities'] = activities.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Activities {
  Activities({
    required this.id,
    required this.userId,
    required this.vendorId,
    required this.inquiryId,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.video,
    required this.audio,
  });
  late final int id;
  late final String userId;
  late final String vendorId;
  late final String inquiryId;
  late final String comment;
  late final String createdAt;
  late final String updatedAt;
  late final List<String> image;
  late final List<dynamic> video;
  late final List<dynamic> audio;

  Activities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    vendorId = json['vendor_id'];
    inquiryId = json['inquiry_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = List.castFrom<dynamic, String>(json['image']);
    video = List.castFrom<dynamic, dynamic>(json['video']);
    audio = List.castFrom<dynamic, dynamic>(json['audio']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['vendor_id'] = vendorId;
    _data['inquiry_id'] = inquiryId;
    _data['comment'] = comment;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['image'] = image;
    _data['video'] = video;
    _data['audio'] = audio;
    return _data;
  }
}
