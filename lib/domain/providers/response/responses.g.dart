// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      json['error'] as bool?,
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
      statusCode: json['statusCode'] as int?,
    )..success = json['success'] as bool?;

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
      'statusCode': instance.statusCode,
    };
