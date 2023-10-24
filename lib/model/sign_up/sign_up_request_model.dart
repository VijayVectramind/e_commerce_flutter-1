// To parse this JSON data, do
//
//     final signUpRequestModel = signUpRequestModelFromJson(jsonString);

import 'dart:convert';

SignUpRequestModel signUpRequestModelFromJson(String str) => SignUpRequestModel.fromJson(json.decode(str));

String signUpRequestModelToJson(SignUpRequestModel data) => json.encode(data.toJson());

class SignUpRequestModel {
    String? name;
    String? email;
    String? mobile;
    String? password;

    SignUpRequestModel({
        required this.name,
        required this.email,
        required this.mobile,
        required this.password,
    });

    factory SignUpRequestModel.fromJson(Map<String, dynamic> json) => SignUpRequestModel(
        name: json["name"]??"",
        email: json["email"]??"",
        mobile: json["mobile"]??"",
        password: json["password"]??"",
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
    };
}
