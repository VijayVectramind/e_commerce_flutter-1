import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();

  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<dynamic> getValue<T>(String key, T defValue) async {
    var prefs = await _instance;
    switch (T) {
      case String:
        return prefs.getString(key) ?? defValue ?? "";
      case int:
        return prefs.getInt(key) ?? defValue ?? 0;
      case double:
        return prefs.getDouble(key) ?? defValue ?? 0;
      case bool:
        return prefs.getBool(key) ?? defValue ?? false;
      case List<String>:
        return prefs.getStringList(key) ?? defValue ?? List.empty();
      default:
        debugPrint("SharedPreferences Invalid key ${key.toString()}");
        return Future.value(false);
    }
  }

  static Future<bool> remove(String key) async {
    var prefs = await _instance;
    return prefs.remove(key);
  }

  static removeKeys() async {
    await _prefsInstance!.remove(PreferencesConstents.USER_DETAILS);
    await _prefsInstance!.remove(PreferencesConstents.TOKEN);
    await _prefsInstance!.remove(PreferencesConstents.USER_DETAILS);
    await _prefsInstance!.remove(PreferencesConstents.IS_LOGGED_IN);
    await _prefsInstance!.remove(PreferencesConstents.NOTIFICATION);
    log("License key files deleted");
  }

  static Future<bool> setValue<T>(
    String key,
    T value,
  ) async {
    var prefs = await _instance;

    switch (T) {
      case String:
        return prefs.setString(key, value as String);
      case int:
        return prefs.setInt(key, value as int);
      case double:
        return prefs.setDouble(key, value as double);
      case bool:
        return prefs.setBool(key, value as bool);
      case List<String>:
        return prefs.setStringList(key, value as List<String>);
      default:
        debugPrint("SharedPreferences Invalid value $value");
        return Future.value(false);
    }

    // return prefs.setString(key, value); // ?? Future.value(false);
  }
}

class PreferencesConstents {
  static String USER_ID = "USER_ID";
  static String TOKEN = "TOKEN";
  static String USER_DETAILS = "USER_DETAILS";
  static String USER_SIGNIN_MOB_EMIAL = "USER_SIGNIN_INPUT";
  static String USER_SIGNIN_PASS = 'PASSWORD';
  static String IS_LOGGED_IN = 'IS_LOGGED_IN';
  static String NOTIFICATION = 'notification';
}
