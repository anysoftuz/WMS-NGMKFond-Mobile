// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:sklad/data/models/products_bases_model.dart';

part 'users_model.g.dart';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

@JsonSerializable()
class UsersModel {
  @JsonKey(name: "users")
  final List<User> users;
  @JsonKey(name: "pagination")
  final Paginator pagination;

  const UsersModel({
    this.users = const [],
    this.pagination = const Paginator(),
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "firstname")
  final String firstname;
  @JsonKey(name: "lastname")
  final String lastname;
  @JsonKey(name: "patronymic")
  final String patronymic;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "position")
  final String position;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "is_oneid_enabled")
  final bool isOneidEnabled;
  @JsonKey(name: "status")
  final String status;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.patronymic,
    required this.avatar,
    required this.position,
    required this.phone,
    required this.isOneidEnabled,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
