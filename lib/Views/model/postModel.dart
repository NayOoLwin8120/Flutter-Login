class UserPostModel {
  Data? data;
  String? message;

  UserPostModel({this.data, this.message});

  UserPostModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? email;
  int? phoneNumber;
  String? password;
  String? sId;
  int? iV;

  Data({this.email, this.phoneNumber, this.password, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}
