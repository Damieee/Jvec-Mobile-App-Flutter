// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      (json['price'] as num).toDouble(),
      json['description'] as String,
      json['tags'] as String,
      json['data_unit'] as String,
      json['renewable'] as bool,
      json['days_to_use'] as int,
      json['title'] as String,
      json['data_value'] as int,
      json['profile_id'] as int,
      json['id'] as int,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'price': instance.price,
      'description': instance.description,
      'tags': instance.tags,
      'data_unit': instance.data_unit,
      'renewable': instance.renewable,
      'days_to_use': instance.days_to_use,
      'title': instance.title,
      'data_value': instance.data_value,
      'profile_id': instance.profile_id,
      'id': instance.id,
    };
