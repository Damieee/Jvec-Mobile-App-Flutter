/// totalTransactions : 10
/// transactions : [{"_id":"62ea9425d9ee918f81f6301d","user":"Vendor","userId":"62d5b1a960a4cf3edc52e8a7","type":"debit","channel":"wallet","amount":221.67749999999998,"desc":"Charges for order rejection","createdAt":"2022-08-03T15:28:37.007Z","updatedAt":"2022-08-03T15:28:37.007Z","__v":0}]

class TransactionModel {
  TransactionModel({
    this.totalTransactions,
    this.transactions,
  });

  TransactionModel.fromJson(dynamic json) {
    totalTransactions = json['totalTransactions'];
    if (json['transactions'] != null) {
      transactions = [];
      json['transactions'].forEach((v) {
        transactions?.add(Transaction.fromJson(v));
      });
    }
  }

  dynamic totalTransactions;
  List<Transaction>? transactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalTransactions'] = totalTransactions;
    if (transactions != null) {
      map['transactions'] = transactions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "62ea9425d9ee918f81f6301d"
/// user : "Vendor"
/// userId : "62d5b1a960a4cf3edc52e8a7"
/// type : "debit"
/// channel : "wallet"
/// amount : 221.67749999999998
/// desc : "Charges for order rejection"
/// createdAt : "2022-08-03T15:28:37.007Z"
/// updatedAt : "2022-08-03T15:28:37.007Z"
/// __v : 0

enum TransactionType { debit, credit }

class Transaction {
  Transaction({
    this.id,
    this.user,
    this.userId,
    this.type,
    this.channel,
    this.amount,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Transaction.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    userId = json['userId'];
    type = json['type'];
    channel = json['channel'];
    amount = json['amount'];
    desc = json['desc'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? user;
  String? userId;
  String? type;
  String? channel;
  dynamic amount;
  String? desc;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['user'] = user;
    map['userId'] = userId;
    map['type'] = type;
    map['channel'] = channel;
    map['amount'] = amount;
    map['desc'] = desc;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
