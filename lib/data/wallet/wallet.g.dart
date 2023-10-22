// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FundwalletResponse _$FundwalletResponseFromJson(Map<String, dynamic> json) =>
    FundwalletResponse(
      link: json['link'] as String,
      reference: json['reference'] as String,
    );

Map<String, dynamic> _$FundwalletResponseToJson(FundwalletResponse instance) =>
    <String, dynamic>{
      'link': instance.link,
      'reference': instance.reference,
    };

VerificationResponse _$VerificationResponseFromJson(
        Map<String, dynamic> json) =>
    VerificationResponse(
      status: json['status'] as String,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$VerificationResponseToJson(
        VerificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'reference': instance.reference,
    };

DebitCard _$DebitCardFromJson(Map<String, dynamic> json) => DebitCard(
      json['last4'] as String,
      json['authorization_code'] as String,
      json['exp_year'] as String,
      json['bank'] as String,
      json['signature'] as String,
      json['country_code'] as String,
      json['id'] as int,
      json['card_type'] as String,
      json['user_email'] as String,
      json['exp_month'] as String,
      json['bin'] as String,
      json['channel'] as String,
      json['reusable'] as bool,
      json['account_name'] as String?,
    );

Map<String, dynamic> _$DebitCardToJson(DebitCard instance) => <String, dynamic>{
      'last4': instance.last4,
      'authorization_code': instance.authorization_code,
      'exp_year': instance.exp_year,
      'bank': instance.bank,
      'signature': instance.signature,
      'country_code': instance.country_code,
      'id': instance.id,
      'card_type': instance.card_type,
      'user_email': instance.user_email,
      'exp_month': instance.exp_month,
      'bin': instance.bin,
      'channel': instance.channel,
      'reusable': instance.reusable,
      'account_name': instance.account_name,
    };
