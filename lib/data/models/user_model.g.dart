// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      patronymic: json['patronymic'] as String?,
      roleId: (json['role_id'] as num?)?.toInt(),
      roleName: json['role_name'] as String?,
      roleTitle: json['role_title'] as String?,
      position: json['position'] as String?,
      positionId: (json['position_id'] as num?)?.toInt(),
      organizationId: json['organization_id'],
      organizationName: json['organization_name'],
      gender: json['gender'] as String?,
      workplaces: (json['workplaces'] as List<dynamic>?)
          ?.map((e) => Workplace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'patronymic': instance.patronymic,
      'role_id': instance.roleId,
      'role_name': instance.roleName,
      'role_title': instance.roleTitle,
      'position': instance.position,
      'position_id': instance.positionId,
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
      'gender': instance.gender,
      'workplaces': instance.workplaces,
    };

Workplace _$WorkplaceFromJson(Map<String, dynamic> json) => Workplace(
      position: json['position'] as String?,
      workplaceType: json['workplace_type'] as String?,
      workplaceId: (json['workplace_id'] as num?)?.toInt(),
      workplace: json['workplace'] as String?,
    );

Map<String, dynamic> _$WorkplaceToJson(Workplace instance) => <String, dynamic>{
      'position': instance.position,
      'workplace_type': instance.workplaceType,
      'workplace_id': instance.workplaceId,
      'workplace': instance.workplace,
    };
