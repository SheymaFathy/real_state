class RegisterResponse {
  int? statusCode;
  bool? status;
  String? message;
  List<RegisterResponseData>? data;


  RegisterResponse(
      {this.statusCode, this.status, this.message, this.data,});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RegisterResponseData>[];
      json['data'].forEach((v) {
        data!.add(RegisterResponseData.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class RegisterResponseData {
  bool? isAuthenticated;
  String? username;
  String? email;
  List<String>? roles;
  String? token;
  String? expiresOn;

  RegisterResponseData(
      {this.isAuthenticated,
        this.username,
        this.email,
        this.roles,
        this.token,
        this.expiresOn});

  RegisterResponseData.fromJson(Map<String, dynamic> json) {
    isAuthenticated = json['isAuthenticated'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    token = json['token'];
    expiresOn = json['expiresOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAuthenticated'] = isAuthenticated;
    data['username'] = username;
    data['email'] = email;
    data['roles'] = roles;
    data['token'] = token;
    data['expiresOn'] = expiresOn;
    return data;
  }
}
