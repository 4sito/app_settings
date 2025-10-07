import 'package:app_settings/abstractions/app_settings_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowTourNotifier extends AppSettingNotifier<bool, bool> {
  @override
  String get key => 'show_tour';

  @override
  bool get defaultValue => true;

  @override
  bool decode(bool value) => value;

  @override
  bool encode(bool value) => value;

  @override
  bool? read(SharedPreferences prefs) => prefs.getBool(key);

  @override
  Future<void> write(SharedPreferences prefs, bool value) =>
      prefs.setBool(key, value);
}
