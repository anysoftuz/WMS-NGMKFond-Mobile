// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserModel {
  @JsonKey(name: "user")
  final User? user;

  const UserModel({this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "firstname")
  final String? firstname;
  @JsonKey(name: "lastname")
  final String? lastname;
  @JsonKey(name: "patronymic")
  final String? patronymic;
  @JsonKey(name: "role_id")
  final int? roleId;
  @JsonKey(name: "role_name")
  final String? roleName;
  @JsonKey(name: "role_title")
  final String? roleTitle;
  @JsonKey(name: "position")
  final String? position;
  @JsonKey(name: "position_id")
  final int? positionId;
  @JsonKey(name: "organization_id")
  final dynamic organizationId;
  @JsonKey(name: "organization_name")
  final dynamic organizationName;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "workplaces")
  final List<Workplace>? workplaces;

  const User({
    this.id,
    this.image,
    this.avatar,
    this.phone,
    this.firstname,
    this.lastname,
    this.patronymic,
    this.roleId,
    this.roleName,
    this.roleTitle,
    this.position,
    this.positionId,
    this.organizationId,
    this.organizationName,
    this.gender,
    this.workplaces,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Workplace {
  @JsonKey(name: "position")
  final String? position;
  @JsonKey(name: "workplace_type")
  final String? workplaceType;
  @JsonKey(name: "workplace_id")
  final int? workplaceId;
  @JsonKey(name: "workplace")
  final String? workplace;

  const Workplace({
    this.position,
    this.workplaceType,
    this.workplaceId,
    this.workplace,
  });

  factory Workplace.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkplaceToJson(this);
}
