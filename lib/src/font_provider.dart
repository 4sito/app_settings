import 'package:app_settings/abstractions/app_settings_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontFamilyNotifier extends AppSettingNotifier<String, String> {
  @override
  String get key => 'font_family';

  @override
  String get defaultValue => '.SF Pro Text';

  @override
  String decode(String value) => value;

  @override
  String encode(String value) => value;

  @override
  String? read(SharedPreferences prefs) => prefs.getString(key);

  @override
  Future<void> write(SharedPreferences prefs, String value) =>
      prefs.setString(key, value);
}
