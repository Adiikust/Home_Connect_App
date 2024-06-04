class AdminLoginModel {
  int? status;
  String? message;
  String? role;
  String? token;
  User? user;

  AdminLoginModel(
      {this.status, this.message, this.role, this.token, this.user});

  AdminLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    role = json['role'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['role'] = this.role;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? image;
  String? password;
  String? authToken;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? roleId;
  String? zoneId;

  User(
      {this.id,
      this.fName,
      this.lName,
      this.phone,
      this.email,
      this.image,
      this.password,
      this.authToken,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.roleId,
      this.zoneId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    password = json['password'];
    authToken = json['auth_token'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
    zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['password'] = this.password;
    data['auth_token'] = this.authToken;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role_id'] = this.roleId;
    data['zone_id'] = this.zoneId;
    return data;
  }
}
