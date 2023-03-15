import 'dart:convert';

class LoginModel {
  String? username;
  String? password;

  LoginModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());
}
