import 'package:app_settings/abstractions/app_settings_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CupertinoThemeMode { system, light, dark }


class ThemeModeNotifier
    extends AppSettingNotifier<CupertinoThemeMode, String> {
  @override
  String get key => 'theme_mode';

  @override
  CupertinoThemeMode get defaultValue => CupertinoThemeMode.system;

  @override
  CupertinoThemeMode decode(String value) {
    switch (value) {
      case 'light': return CupertinoThemeMode.light;
      case 'dark': return CupertinoThemeMode.dark;
      default: return CupertinoThemeMode.system;
    }
  }
  @override
  String encode(CupertinoThemeMode value) => value.name;

  @override
  String? read(SharedPreferences prefs) => prefs.getString(key);

  @override
  Future<void> write(SharedPreferences prefs, String value) =>
      prefs.setString(key, value);
}
