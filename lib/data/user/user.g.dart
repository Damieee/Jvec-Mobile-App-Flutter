// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      id: json['id'] as int,
      balance: (json['balance'] as num).toDouble(),
      data_cap: (json['data_cap'] as num?)?.toDouble(),
      data_used: (json['data_used'] as num?)?.toDouble(),
      from_date: json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      to_date: json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
      name: json['name'] as String?,
      address: json['address'] as String?,
      profile: json['profile'] as String,
      surname: json['surname'] as String?,
      token: json['token'] == null
          ? null
          : Token.fromJson(json['token'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    )..contacts = (json['contacts'] as List<dynamic>?)
        ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'id': instance.id,
      'balance': instance.balance,
      'data_cap': instance.data_cap,
      'data_used': instance.data_used,
      'from_date': instance.from_date?.toIso8601String(),
      'to_date': instance.to_date?.toIso8601String(),
      'name': instance.name,
      'address': instance.address,
      'profile': instance.profile,
      'surname': instance.surname,
      'token': instance.token,
      'contacts': instance.contacts,
      'data': instance.data,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['access_token'] as String,
      json['refresh_token'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      data_cap: (json['data_cap'] as num).toDouble(),
      data_used: (json['data_used'] as num).toDouble(),
      from_date: json['from_date'] == null
          ? null
          : DateTime.parse(json['from_date'] as String),
      to_date: json['to_date'] == null
          ? null
          : DateTime.parse(json['to_date'] as String),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'data_cap': instance.data_cap,
      'data_used': instance.data_used,
      'from_date': instance.from_date?.toIso8601String(),
      'to_date': instance.to_date?.toIso8601String(),
    };

UserCredentials _$UserCredentialsFromJson(Map<String, dynamic> json) =>
    UserCredentials(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserCredentialsToJson(UserCredentials instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      json['first_name'] as String,
      json['last_name'] as String,
      json['phone_number'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
    };
