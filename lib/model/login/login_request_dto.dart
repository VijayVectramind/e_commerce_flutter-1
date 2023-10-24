// To parse this JSON data, do
//
//     final LoginRequestModel = LoginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel LoginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String LoginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
    String email;
    String password;

    LoginRequestModel({
        required this.email,
        required this.password,
    });

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
