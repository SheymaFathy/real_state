import 'dart:io';

class RegisterUserModel {
  String? username;
  String? firstName;
  String? lastName;
  String? address;
  String? phoneNumber;
  int? userType;
  String? email;
  String? phone;
  String? password;
  File? photo;


  RegisterUserModel({
    this.username,
    this.firstName,
    this.lastName,
    this.address,
    this.phoneNumber,
    this.userType,
    this.email,
    this.phone,
    this.password,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      if (username != null) 'UserName': username,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (address != null) 'Address': address,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (userType != null) 'UserTypeId': userType.toString(),
      if (email != null) 'Email': email,
      if (phone != null) 'PhoneNumber': phone,
      if (password != null) 'Password': password,

    };
  }
}
