// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class FundwalletResponse {
  String link;
  String reference;

  FundwalletResponse({
    required this.link,
    required this.reference,
  });

  factory FundwalletResponse.fromJson(Map<String, dynamic> json) =>
      _$FundwalletResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FundwalletResponseToJson(this);
}

// [log]  Response Body: {"status":true,"message":"Payment unsuccessful","data":{"status":"abandoned","reference":"uxbv59qc1k"}}

@JsonSerializable()
class VerificationResponse {
  String status;
  String? reference;
  VerificationResponse({
    required this.status,
    required this.reference,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationResponseToJson(this);
}

/* {
      "last4": "4449",
      "user_id": 106,
      "authorization_code": "AUTH_8on4gsx0fp",
      "exp_year": "2024",
      "bank": "Kuda Bank",
      "signature": "SIG_ZQGqhucxSnEUr9wWoVBA",
      "country_code": "NG",
      "id": 1,
      "card_type": "visa debit",
      "user_email": "avan@gmail.com",
      "exp_month": "11",
      "bin": "410540",
      "channel": "card",
      "reusable": true,
      "account_name": null
    }, */

typedef DebitCards = List<DebitCard>;

@JsonSerializable()
class DebitCard {
  String last4;
  String authorization_code;
  String exp_year;
  String bank;
  String signature;
  String country_code;
  int id;
  String card_type;
  String user_email;
  String exp_month;
  String bin;
  String channel;
  bool reusable;
  String? account_name;

  DebitCard(
    this.last4,
    this.authorization_code,
    this.exp_year,
    this.bank,
    this.signature,
    this.country_code,
    this.id,
    this.card_type,
    this.user_email,
    this.exp_month,
    this.bin,
    this.channel,
    this.reusable,
    this.account_name,
  );

  factory DebitCard.fromJson(Map<String, dynamic> json) =>
      _$DebitCardFromJson(json);
  Map<String, dynamic> toJson() => _$DebitCardToJson(this);
}
