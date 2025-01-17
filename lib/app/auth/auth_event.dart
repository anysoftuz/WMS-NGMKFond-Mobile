part of 'auth_bloc.dart';

sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;
  final Function(String text) onError;

  LoginEvent({
    required this.phone,
    required this.password,
    required this.onError,
  });
}

class CheckUserEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class GetMeEvent extends AuthEvent {}

class RefreshEvent extends AuthEvent {}

class UpdateMeEvent extends AuthEvent {}

class SendCodeEvent extends AuthEvent {
  final String phone;
  final Function(SendCodeModel model) onSucces;
  final Function(String model) onError;

  SendCodeEvent({
    required this.phone,
    required this.onSucces,
    required this.onError,
  });
}

class VerifyCodeEvent extends AuthEvent {
  final String phone;
  final String code;
  final String otpSessionId;
  final VoidCallback onSucces;
  final Function(String model) onError;

  VerifyCodeEvent({
    required this.phone,
    required this.code,
    required this.otpSessionId,
    required this.onSucces,
    required this.onError,
  });
}

class UpdatePasswordEvent extends AuthEvent {
  final String oldPassword;
  final String newPassword;

  UpdatePasswordEvent({required this.oldPassword, required this.newPassword});
}

class ForgotPasswordEvent extends AuthEvent {
  final String phone;
  final String code;
  final String otpSessionId;
  final String newPassword;
  final VoidCallback onSucces;
  final Function(String model) onError;

  ForgotPasswordEvent({
    required this.phone,
    required this.code,
    required this.otpSessionId,
    required this.newPassword,
    required this.onSucces,
    required this.onError,
  });
}
