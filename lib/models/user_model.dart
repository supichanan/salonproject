import 'dart:convert';

import 'package:salonproject/utility/my_constant.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String typeUser;
  final String email;
  final String password;
  final String? urlImage;
  UserModel({
    required this.name,
    required this.typeUser,
    required this.email,
    required this.password,
    this.urlImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'typeUser': typeUser,
      'email': email,
      'password': password,
      'urlImage': urlImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: (map['name'] ?? '') as String,
      typeUser: (map['typeUser'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      urlImage: map['urlImage'] ?? Myconstant.urlAvatar,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
