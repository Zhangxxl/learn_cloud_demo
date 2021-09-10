import 'package:flutter/material.dart';
import 'package:yicbridge_aj_app/constant.dart';
import 'package:yicbridge_aj_app/util/global.dart';

import '../generated/l10n.dart';

abstract class AppTheme {
  abstract final ThemeData theme;
  abstract final int themeId;
  abstract final String themeName;

  static late final allLightTheme = [BlueTheme.instance, RedTheme.instance, PurpleTheme.instance];
  static late final defaultTheme = BlueTheme.instance;
  static late final darkTheme = DarkTheme.instance;

  static const int THEME_MODE_SYSTEM = 0;
  static const int THEME_MODE_DARK = 1;
  static const int THEME_MODE_LIGHT = 2;

  static int currentThemeMode = THEME_MODE_SYSTEM;
  static late AppTheme currentTheme = defaultTheme;

  static AppTheme loadThemeFromLocal() {
    final int? localThemeId = sp.getInt(Constant.SP_KEY_THEME);
    if (localThemeId != null) {
      currentTheme = allLightTheme.firstWhere((element) => element.themeId == localThemeId, orElse: () => defaultTheme);
    }
    return currentTheme;
  }

  static Future<void> saveThemeToLocal(AppTheme theme) async {
    currentTheme = theme;
    await sp.setInt(Constant.SP_KEY_THEME, theme.themeId);
  }

  static int loadThemeModeFromLocal() {
    final mode = sp.getInt(Constant.SP_KEY_THEME_MODE);
    if (mode != null) {
      currentThemeMode = mode;
    }
    return currentThemeMode;
  }

  static Future<void> saveThemeModeFromLocal(int mode) async {
    await sp.setInt(Constant.SP_KEY_THEME_MODE, mode);
  }
}

class BlueTheme extends AppTheme {
  BlueTheme._();

  static late final instance = BlueTheme._();

  @override
  ThemeData get theme => ThemeData(primarySwatch: Colors.blue);

  @override
  int get themeId => 0;

  @override
  String get themeName => S.current.theme_blue;
}

class RedTheme extends AppTheme {
  RedTheme._();
  static late final instance = RedTheme._();

  @override
  ThemeData get theme => ThemeData(primarySwatch: Colors.red);

  @override
  int get themeId => 1;

  @override
  String get themeName => S.current.theme_red;
}

class PurpleTheme extends AppTheme {
  PurpleTheme._();
  static late final instance = PurpleTheme._();

  @override
  ThemeData get theme => ThemeData(primarySwatch: Colors.purple);

  @override
  int get themeId => 2;

  @override
  String get themeName => S.current.theme_purple;
}

class DarkTheme extends AppTheme {
  DarkTheme._();
  static late final instance = DarkTheme._();

  @override
  ThemeData get theme => ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue[500],
        brightness: Brightness.dark,
      ));

  @override
  int get themeId => 2;

  @override
  String get themeName => S.current.theme_dark;
}
