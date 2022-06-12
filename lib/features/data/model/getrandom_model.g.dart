// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getrandom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRandomUserModel _$GetRandomUserModelFromJson(Map<String, dynamic> json) =>
    GetRandomUserModel(
      (json['results'] as List<dynamic>)
          .map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      Info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRandomUserModelToJson(GetRandomUserModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'info': instance.info,
    };
