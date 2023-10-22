// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sale.g.dart';

/*
                "_id": "6352cd7757e34f9d40b87228",
                "vendorId": "634d64ea932526ae5acf371e",
                "orderId": "6352cbc757e34f9d40b87184",
                "amountReceived": 800,
                "createdAt": "2022-10-21T16:48:55.651Z",
                "updatedAt": "2022-10-21T16:48:55.651Z",
                "__v": 0
 */

typedef Sales = List<Sale>;

@JsonSerializable()
class Sale {
  @JsonKey(name: '_id')
  String id;
  String vendorId;
  String orderId;
  double amountReceived;
  DateTime createdAt;
  DateTime updatedAt;

  Sale({
    required this.id,
    required this.vendorId,
    required this.orderId,
    required this.amountReceived,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);
  Map<String, dynamic> toJson() => _$SaleToJson(this);
}
