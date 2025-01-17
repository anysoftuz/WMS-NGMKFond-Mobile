// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordModel _$ForgetPasswordModelFromJson(Map<String, dynamic> json) =>
    ForgetPasswordModel(
      phone: json['phone'] as String,
      code: json['code'] as String,
      newPassword: json['new_password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      otpSessionId: json['otp_session_id'] as String,
    );

Map<String, dynamic> _$ForgetPasswordModelToJson(
        ForgetPasswordModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'new_password': instance.newPassword,
      'password_confirmation': instance.passwordConfirmation,
      'otp_session_id': instance.otpSessionId,
    };
