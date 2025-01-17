// To parse this JSON data, do
//
//     final verifyCodeModel = verifyCodeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'verify_code_model.g.dart';

VerifyCodeModel verifyCodeModelFromJson(String str) => VerifyCodeModel.fromJson(json.decode(str));

String verifyCodeModelToJson(VerifyCodeModel data) => json.encode(data.toJson());

@JsonSerializable()
class VerifyCodeModel {
    @JsonKey(name: "phone")
    final String phone;
    @JsonKey(name: "code")
    final String code;
    @JsonKey(name: "otp_session_id")
    final String otpSessionId;

    VerifyCodeModel({
        required this.phone,
        required this.code,
        required this.otpSessionId,
    });

    factory VerifyCodeModel.fromJson(Map<String, dynamic> json) => _$VerifyCodeModelFromJson(json);

    Map<String, dynamic> toJson() => _$VerifyCodeModelToJson(this);
}
