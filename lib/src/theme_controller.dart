import 'dart:ui';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider =
    AsyncNotifierProvider<ThemeModeNotifier, CupertinoThemeMode>(
        ThemeModeNotifier.new);

final fontFamilyProvider =
    AsyncNotifierProvider<FontFamilyNotifier, String>(
        FontFamilyNotifier.new);

final seedColorProvider =
    AsyncNotifierProvider<SeedColorNotifier, Color>(
        SeedColorNotifier.new);

final allSettingsProvider = Provider<AsyncValue<List<dynamic>>>((ref) {
  return combineSettings([
    ref.watch(seedColorProvider),
    ref.watch(themeModeProvider),
    ref.watch(fontFamilyProvider),
  ]);
});
