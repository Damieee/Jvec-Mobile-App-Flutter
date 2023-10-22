import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../data/user/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  SharedPreferences _prefs;

  AppSharedPrefs._(this._prefs);

  static Future<AppSharedPrefs> create() async =>
      AppSharedPrefs._(await SharedPreferences.getInstance());

  static AppSharedPrefs get instance => Get.find<AppSharedPrefs>();

  // -------------------------

  Future<bool> clear() async {
    return _prefs.clear();
  }

  saveItem(String name) async {
    _prefs.setBool(name, true);
  }

  deleteItem(String name) {
    _prefs.remove(name);
  }

  bool getItem(String name) {
    var data = _prefs.get(name);
    if (data == null) {
      return false;
    }

    return true;
  }

// User
  Future<bool> setUser(User user) =>
      _prefs.setString('user', jsonEncode(user.toJson()).toString());

  User? get user {
    final data = _prefs.get('user');

    if (data == null) {
      return null;
    }

    return User.fromJson(jsonDecode((data as String)));
  }

  // Objects
  Future<bool> saveObject(String key, dynamic object) {
    debugPrint("Saved Object: ${jsonEncode(object.toJson()).toString()}}");
    return _prefs.setString(key, jsonEncode(object.toJson()).toString());
  }

  dynamic getObject(String key) {
    final data = _prefs.get(key);

    if (data == null) {
      return null;
    }

    return jsonDecode((data as String));
  }

  Future<bool> deleteObject(String key) {
    return _prefs.remove(key);
  }
}
