class SubCategoriesIdBaseListingShowModel {
  SubCategoriesIdBaseListingShowModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data12> data;

  SubCategoriesIdBaseListingShowModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data12.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data12 {
  Data12({
    required this.id,
    required this.name,
    required this.translations,
  });
  late final dynamic id;
  late final String name;
  late final List<dynamic> translations;

  Data12.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    translations = List.castFrom<dynamic, dynamic>(json['translations']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['translations'] = translations;
    return _data;
  }
}
