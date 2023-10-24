// To parse this JSON data, do
//
//     final LoginResponseModel = loginResponseDtoFromJson(jsonString);

import 'dart:convert';

LoginResponseModel LoginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String LoginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    bool success;
    UserDto userDto;

    LoginResponseModel({
        required this.success,
        required this.userDto,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        success: json["success"],
        userDto: UserDto.fromJson(json["userDTO"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "userDTO": userDto.toJson(),
    };
}

class UserDto {
    String id;
    String name;
    String email;
    int mobile;
    String password;
    int v;

    UserDto({
        required this.id,
        required this.name,
        required this.email,
        required this.mobile,
        required this.password,
        required this.v,
    });

    factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "__v": v,
    };
}
