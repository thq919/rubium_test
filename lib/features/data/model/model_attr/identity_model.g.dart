// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identity _$IdentityFromJson(Map<String, dynamic> json) => Identity(
      Picture.fromJson(json['picture'] as Map<String, dynamic>),
      json['gender'] as String,
      Name.fromJson(json['name'] as Map<String, dynamic>),
      Location.fromJson(json['location'] as Map<String, dynamic>),
      json['email'] as String,
      Login.fromJson(json['login'] as Map<String, dynamic>),
      Dob.fromJson(json['dob'] as Map<String, dynamic>),
      Registered.fromJson(json['registered'] as Map<String, dynamic>),
      json['phone'] as String,
      json['cell'] as String,
      Id.fromJson(json['id'] as Map<String, dynamic>),
      json['nat'] as String,
    );

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'login': instance.login,
      'dob': instance.dob,
      'registered': instance.registered,
      'phone': instance.phone,
      'cell': instance.cell,
      'id': instance.id,
      'picture': instance.picture,
      'nat': instance.nat,
    };
