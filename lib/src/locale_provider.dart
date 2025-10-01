import 'dart:io';
import 'dart:ui';

import 'package:app_settings/abstractions/app_settings_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends AppSettingNotifier<Locale, String> {
  @override
  String get key => 'locale';

  @override
  Locale get defaultValue => Locale(Platform.localeName);

  @override
  Locale decode(String value) => Locale(value);

  @override
  String encode(Locale value) => value.languageCode;

  @override
  String? read(SharedPreferences prefs) => prefs.getString(key);

  @override
  Future<void> write(SharedPreferences prefs, String value) =>
      prefs.setString(key, value);
}
