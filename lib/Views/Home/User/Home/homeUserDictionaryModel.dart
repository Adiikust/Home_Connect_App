class HomeUserDictionaryModel {
  HomeUserDictionaryModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data12> data;

  HomeUserDictionaryModel.fromJson(Map<String, dynamic> json) {
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
    required this.imageUrl,
  });
  late final int id;
  late final String name;
  late final String imageUrl;

  Data12.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image_url'] = imageUrl;
    return _data;
  }
}
