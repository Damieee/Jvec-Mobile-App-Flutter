// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:freezed_annotation/freezed_annotation.dart';
//part 'user.freezed.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? email;
  String? phone;
  String? username;
  int id;
  double balance;
  double? data_cap;
  double? data_used;
  DateTime? from_date;
  DateTime? to_date;
  String? name;
  String? address;
  String profile;
  String? surname;

  Token? token;
  Contacts? contacts;

  UserData? data;

  User({
    this.email,
    this.phone,
    this.username,
    required this.id,
    required this.balance,
    this.data_cap,
    this.data_used,
    this.from_date,
    this.to_date,
    this.name,
    this.address,
    required this.profile,
    this.surname,
    this.token,
    this.data,
  });

  factory User.zero() => User(id: 0, balance: 0, profile: '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // For irregular response on signup endpoint
  factory User.fromJsonWithToken(
      Map<String, Object?> user, Map<String, Object?> token) {
    user.putIfAbsent('token', () => token);
    return _$UserFromJson(user);
  }

  /*  String? get sureEmail {
    if (email != null) {
      return email;
    } else if (this.type == UserType.vendor) {
      return this.vendorProfile?.vendors?[0].email;
    }

    return this.customerProfile?.email;
  } */

  User copyWith({
    String? email,
    String? phone,
    String? username,
    int? id,
    double? balance,
    double? data_cap,
    double? data_used,
    DateTime? from_date,
    DateTime? to_date,
    String? name,
    String? address,
    String? profile,
    String? surname,
    Token? token,
    UserData? data,
  }) {
    return User(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      id: id ?? this.id,
      balance: balance ?? this.balance,
      data_cap: data_cap ?? this.data_cap,
      data_used: data_used ?? this.data_used,
      from_date: from_date ?? this.from_date,
      to_date: to_date ?? this.to_date,
      name: name ?? this.name,
      address: address ?? this.address,
      profile: profile ?? this.profile,
      surname: surname ?? this.surname,
      token: token ?? this.token,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable()
class Token {
  String access_token;
  String refresh_token;

  Token(
    this.access_token,
    this.refresh_token,
  );

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class UserData {
  double data_cap;
  double data_used;
  DateTime? from_date;
  DateTime? to_date;

  UserData({
    required this.data_cap,
    required this.data_used,
    this.from_date,
    this.to_date,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class UserCredentials {
  String email;
  String password;

  UserCredentials({
    required this.email,
    required this.password,
  });

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$UserCredentialsToJson(this);
}

typedef Contacts = List<Contact>;

@JsonSerializable()
class Contact {
  String first_name;
  String last_name;
  String phone_number;

  Contact(
    this.first_name,
    this.last_name,
    this.phone_number,
  );

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
