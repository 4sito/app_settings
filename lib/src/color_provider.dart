import 'package:app_settings/abstractions/app_settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeedColorNotifier extends AppSettingNotifier<Color, int> {
  @override
  String get key => 'seed_color';

  @override
  Color get defaultValue => const Color.fromARGB(255, 31, 78, 121);

  @override
  Color decode(int value) => Color(value);

  @override
  int encode(Color value) => value.toARGB32();

  @override
  int? read(SharedPreferences prefs) => prefs.getInt(key);

  @override
  Future<void> write(SharedPreferences prefs, int value) =>
      prefs.setInt(key, value);
}
