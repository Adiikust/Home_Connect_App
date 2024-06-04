class LoginModel {
  int? status;
  String? message;
  String? role;
  String? token;
  User? user;

  LoginModel({this.status, this.message, this.role, this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? description;
  String? vendorTypeId;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? bankName;
  String? branch;
  String? holderName;
  String? accountNo;
  String? image;
  String? status;
  String? firebaseToken;

  User(
      {this.id,
      this.name,
      this.fName,
      this.lName,
      this.phone,
      this.email,
      this.description,
      this.vendorTypeId,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.bankName,
      this.branch,
      this.holderName,
      this.accountNo,
      this.image,
      this.status,
      this.firebaseToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    description = json['description'];
    vendorTypeId = json['vendor_type_id'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bankName = json['bank_name'];
    branch = json['branch'];
    holderName = json['holder_name'];
    accountNo = json['account_no'];
    image = json['image'];
    status = json['status'];
    firebaseToken = json['firebase_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['description'] = this.description;
    data['vendor_type_id'] = this.vendorTypeId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['bank_name'] = this.bankName;
    data['branch'] = this.branch;
    data['holder_name'] = this.holderName;
    data['account_no'] = this.accountNo;
    data['image'] = this.image;
    data['status'] = this.status;
    data['firebase_token'] = this.firebaseToken;
    return data;
  }
}
