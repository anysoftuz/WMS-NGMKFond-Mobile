// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeModel _$VerifyCodeModelFromJson(Map<String, dynamic> json) =>
    VerifyCodeModel(
      phone: json['phone'] as String,
      code: json['code'] as String,
      otpSessionId: json['otp_session_id'] as String,
    );

Map<String, dynamic> _$VerifyCodeModelToJson(VerifyCodeModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'otp_session_id': instance.otpSessionId,
    };
