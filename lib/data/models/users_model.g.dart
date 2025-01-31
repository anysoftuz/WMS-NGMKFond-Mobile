// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? const Paginator()
          : Paginator.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'users': instance.users,
      'pagination': instance.pagination,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      patronymic: json['patronymic'] as String,
      avatar: json['avatar'] as String,
      position: json['position'] as String,
      phone: json['phone'] as String,
      isOneidEnabled: json['is_oneid_enabled'] as bool,
      status: json['status'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'patronymic': instance.patronymic,
      'avatar': instance.avatar,
      'position': instance.position,
      'phone': instance.phone,
      'is_oneid_enabled': instance.isOneidEnabled,
      'status': instance.status,
    };
