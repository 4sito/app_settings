import 'dart:ui';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider =
    AsyncNotifierProvider<ThemeModeNotifier, CupertinoThemeMode>(
      ThemeModeNotifier.new,
    );

final fontFamilyProvider = AsyncNotifierProvider<FontFamilyNotifier, String>(
  FontFamilyNotifier.new,
);

final seedColorProvider = AsyncNotifierProvider<SeedColorNotifier, Color>(
  SeedColorNotifier.new,
);

final localeProvider = AsyncNotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

final allSettingsProvider = Provider<AsyncValue<AppSettings>>((ref) {
  final seedColor = ref.watch(seedColorProvider);
  final themeMode = ref.watch(themeModeProvider);
  final fontFamily = ref.watch(fontFamilyProvider);
  final locale = ref.watch(localeProvider);

  if (seedColor.isLoading || themeMode.isLoading || fontFamily.isLoading || locale.isLoading) {
    return const AsyncValue.loading();
  }
  if (seedColor.hasError) {
    return AsyncValue.error(
      seedColor.error!,
      seedColor.stackTrace ?? StackTrace.current,
    );
  }
  if (themeMode.hasError) {
    return AsyncValue.error(
      themeMode.error!,
      themeMode.stackTrace ?? StackTrace.current,
    );
  }
  if (fontFamily.hasError) {
    return AsyncValue.error(
      fontFamily.error!,
      fontFamily.stackTrace ?? StackTrace.current,
    );
  }

  if (locale.hasError) {
    return AsyncValue.error(
      locale.error!,
      locale.stackTrace ?? StackTrace.current,
    );
  }

  return AsyncValue.data(
    AppSettings(
      seedColor: seedColor.value!,
      themeMode: themeMode.value!,
      fontFamily: fontFamily.value!,
      locale: locale.value!,
    ),
  );
});
