import 'dart:ui';
import 'package:app_settings/app_settings.dart';
import 'package:app_settings/src/tour_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AsyncValue<dynamic> providerError(AsyncValue provider) {
  return AsyncValue.error(
    provider.error!,
    provider.stackTrace ?? StackTrace.current,
  );
}

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

final showTourProvider = AsyncNotifierProvider<ShowTourNotifier, bool>(
  ShowTourNotifier.new,
);

final allSettingsProvider = Provider<AsyncValue<AppSettings>>((ref) {
  final seedColor = ref.watch(seedColorProvider);
  final themeMode = ref.watch(themeModeProvider);
  final fontFamily = ref.watch(fontFamilyProvider);
  final locale = ref.watch(localeProvider);
  final showTour = ref.watch(showTourProvider);

  if (seedColor.isLoading ||
      themeMode.isLoading ||
      fontFamily.isLoading ||
      locale.isLoading ||
      showTour.isLoading) {
    return const AsyncValue.loading();
  }
  if (seedColor.hasError) {
    providerError(seedColor);
  }
  if (themeMode.hasError) {
    providerError(themeMode);
  }
  if (fontFamily.hasError) {
    providerError(fontFamily);
  }

  if (locale.hasError) {
    providerError(locale);
  }

  if (showTour.hasError) {
    providerError(showTour);
  }

  return AsyncValue.data(
    AppSettings(
      seedColor: seedColor.value!,
      themeMode: themeMode.value!,
      fontFamily: fontFamily.value!,
      locale: locale.value!,
      showTour: showTour.value!,
    ),
  );
});
