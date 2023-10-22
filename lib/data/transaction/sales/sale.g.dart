// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map<String, dynamic> json) => Sale(
      id: json['_id'] as String,
      vendorId: json['vendorId'] as String,
      orderId: json['orderId'] as String,
      amountReceived: (json['amountReceived'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      '_id': instance.id,
      'vendorId': instance.vendorId,
      'orderId': instance.orderId,
      'amountReceived': instance.amountReceived,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
