// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) => SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) => json.encode(data.toJson());

class SignUpResponseModel {
    String? name;
    String? email;
    int? mobile;
    String? password;
    String? id;
    int? v;

    SignUpResponseModel({
        required this.name,
        required this.email,
        required this.mobile,
        required this.password,
        required this.id,
        required this.v,
    });

    factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        name: json["name"]??"",
        email: json["email"]??"",
        mobile: json["mobile"]??0,
        password: json["password"]??"",
        id: json["_id"]??"",
        v: json["__v"]??0,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "_id": id,
        "__v": v,
    };
}
