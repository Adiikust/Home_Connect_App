class BirdsModel {
  BirdsModel({
    required this.data,
  });
  late final List<String> data;

  BirdsModel.fromJson(Map<String, dynamic> json){
    data = List.castFrom<dynamic, String>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data;
    return _data;
  }
}