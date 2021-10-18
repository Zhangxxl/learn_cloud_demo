import 'package:flutter/material.dart';

import '../constant.dart';
import '../generated/l10n.dart';
import '../util/ext/map_ext.dart';
import '../util/global.dart';

abstract class AppTheme {
  abstract final ThemeData theme;
  abstract final int themeId;
  abstract final String themeName;

  static late final allLightTheme = [BlueTheme.instance, RedTheme.instance, PurpleTheme.instance];
  static late final defaultTheme = BlueTheme.instance;
  static late final darkTheme = DarkTheme.instance;

  static const themeModes = {0: ThemeMode.system, 1: ThemeMode.dark, 2: ThemeMode.light};

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

  static ThemeMode loadThemeModeFromLocal() {
    final mode = sp.getInt(Constant.SP_KEY_THEME_MODE);
    return mode == null ? ThemeMode.system : themeModes[mode]!;
  }

  static Future<void> saveThemeModeFromLocal(ThemeMode mode) async {
    await sp.setInt(Constant.SP_KEY_THEME_MODE, themeModes.findFirst((k, v) => v == mode)!.key);
  }
}

class BlueTheme extends AppTheme {
  BlueTheme._();

  static late final instance = BlueTheme._();

  @override
  ThemeData theme = ThemeData(primarySwatch: Colors.blue);

  @override
  int get themeId => 0;

  @override
  String get themeName => S.current.theme_blue;
}

class RedTheme extends AppTheme {
  RedTheme._();
  static late final instance = RedTheme._();

  @override
  ThemeData theme = ThemeData(primarySwatch: Colors.red);

  @override
  int get themeId => 1;

  @override
  String get themeName => S.current.theme_red;
}

class PurpleTheme extends AppTheme {
  PurpleTheme._();
  static late final instance = PurpleTheme._();

  @override
  ThemeData theme = ThemeData(primarySwatch: Colors.purple);

  @override
  int get themeId => 2;

  @override
  String get themeName => S.current.theme_purple;
}

class DarkTheme extends AppTheme {
  DarkTheme._();
  static late final instance = DarkTheme._();

  @override
  ThemeData theme = ThemeData(
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
