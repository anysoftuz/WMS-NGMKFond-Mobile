// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final FormzSubmissionStatus status;
  final AuthenticationStatus statusAuth;
  final UserModel userModel;
  const AuthState({
    this.status = FormzSubmissionStatus.initial,
    this.statusAuth = AuthenticationStatus.loading,
    this.userModel = const UserModel(),
  });

  @override
  List<Object> get props => [
        status,
        statusAuth,
        userModel,
      ];

  AuthState copyWith({
    FormzSubmissionStatus? status,
    AuthenticationStatus? statusAuth,
    UserModel? userModel,
  }) {
    return AuthState(
      status: status ?? this.status,
      statusAuth: statusAuth ?? this.statusAuth,
      userModel: userModel ?? this.userModel,
    );
  }
}
