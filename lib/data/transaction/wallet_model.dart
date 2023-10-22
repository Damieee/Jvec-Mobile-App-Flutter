/// bankDetails : {"accountName":"OLAWALE ABDULWAHAB OLAIFA","accountNumber":"0099789249","bankName":"Access Bank (Diamond)","bankCode":"063"}
/// _id : "62d7077e20a934f539e4cdeb"
/// vendorId : "62d5b1a960a4cf3edc52e8a7"
/// balance : 71014.5
/// createdAt : "2022-07-19T19:35:26.716Z"
/// updatedAt : "2022-08-26T18:22:38.594Z"
/// __v : 0

class WalletModel {
  WalletModel({
    this.bankDetails,
    this.id,
    this.vendorId,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  WalletModel.fromJson(dynamic json) {
    bankDetails = json['bankDetails'] != null
        ? BankDetails.fromJson(json['bankDetails'])
        : null;
    id = json['_id'];
    vendorId = json['vendorId'];
    balance = json['balance'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  BankDetails? bankDetails;
  String? id;
  String? vendorId;
  num? balance;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (bankDetails != null) {
      map['bankDetails'] = bankDetails?.toJson();
    }
    map['_id'] = id;
    map['vendorId'] = vendorId;
    map['balance'] = balance;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

/// accountName : "OLAWALE ABDULWAHAB OLAIFA"
/// accountNumber : "0099789249"
/// bankName : "Access Bank (Diamond)"
/// bankCode : "063"

class BankDetails {
  BankDetails({
    this.accountName,
    this.accountNumber,
    this.bankName,
    this.bankCode,
  });

  BankDetails.fromJson(dynamic json) {
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
  }

  String? accountName;
  String? accountNumber;
  String? bankName;
  String? bankCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accountName'] = accountName;
    map['accountNumber'] = accountNumber;
    map['bankName'] = bankName;
    map['bankCode'] = bankCode;
    return map;
  }
}
