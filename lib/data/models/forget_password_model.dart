// To parse this JSON data, do
//
//     final forgetPasswordModel = forgetPasswordModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'forget_password_model.g.dart';

ForgetPasswordModel forgetPasswordModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());

@JsonSerializable()
class ForgetPasswordModel {
    @JsonKey(name: "phone")
    final String phone;
    @JsonKey(name: "code")
    final String code;
    @JsonKey(name: "new_password")
    final String newPassword;
    @JsonKey(name: "password_confirmation")
    final String passwordConfirmation;
    @JsonKey(name: "otp_session_id")
    final String otpSessionId;

    ForgetPasswordModel({
        required this.phone,
        required this.code,
        required this.newPassword,
        required this.passwordConfirmation,
        required this.otpSessionId,
    });

    factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => _$ForgetPasswordModelFromJson(json);

    Map<String, dynamic> toJson() => _$ForgetPasswordModelToJson(this);
}
