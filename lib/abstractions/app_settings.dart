import 'dart:ui';

import 'package:app_settings/app_settings.dart';

class AppSettings {
  final Color seedColor;
  final CupertinoThemeMode themeMode;
  final String fontFamily;
  final Locale locale;
  final bool showTour;

  AppSettings({
    required this.seedColor,
    required this.themeMode,
    required this.fontFamily,
    required this.locale,
    required this.showTour,
  });
}
