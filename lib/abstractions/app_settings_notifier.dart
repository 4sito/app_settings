import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Generic persisted app-wide setting.
///
/// - `T`: The actual type you want to expose (Color, ThemeMode, String…)
/// - `S`: The primitive type SharedPreferences can store (int, double, bool, String).
abstract class AppSettingNotifier<T, S> extends AsyncNotifier<T> {
  String get key;
  T get defaultValue;

  T decode(S value);
  S encode(T value);

  S? read(SharedPreferences prefs);
  Future<void> write(SharedPreferences prefs, S value);

  @override
  Future<T> build() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = read(prefs);
    return stored != null ? decode(stored) : defaultValue;
  }

  Future<void> set(T value) async {
    state = AsyncValue.data(value);
    final prefs = await SharedPreferences.getInstance();
    await write(prefs, encode(value));
  }

  Future<void> reset() async {
    state = AsyncValue.data(defaultValue);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
