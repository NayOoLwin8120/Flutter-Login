class UserModel {
  List<Data>? data;
  String? message;

  UserModel({this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  int? phoneNumber;
  String? password;
  int? iV;

  Data({this.sId, this.email, this.phoneNumber, this.password, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['__v'] = iV;
    return data;
  }
}
