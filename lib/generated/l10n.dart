// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Test App`
  String get appName {
    return Intl.message(
      'Test App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Please input account`
  String get accHint {
    return Intl.message(
      'Please input account',
      name: 'accHint',
      desc: '',
      args: [],
    );
  }

  /// `Please input password`
  String get pwdHint {
    return Intl.message(
      'Please input password',
      name: 'pwdHint',
      desc: '',
      args: [],
    );
  }

  /// `Register an account`
  String get registerAcc {
    return Intl.message(
      'Register an account',
      name: 'registerAcc',
      desc: '',
      args: [],
    );
  }

  /// `forget the password`
  String get forgetPwd {
    return Intl.message(
      'forget the password',
      name: 'forgetPwd',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `register`
  String get register {
    return Intl.message(
      'register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `please wait...`
  String get waiting {
    return Intl.message(
      'please wait...',
      name: 'waiting',
      desc: '',
      args: [],
    );
  }

  /// `Registration failed`
  String get register_fail {
    return Intl.message(
      'Registration failed',
      name: 'register_fail',
      desc: '',
      args: [],
    );
  }

  /// `Registration failed, duplicate account`
  String get register_fail_acc {
    return Intl.message(
      'Registration failed, duplicate account',
      name: 'register_fail_acc',
      desc: '',
      args: [],
    );
  }

  /// `Registration success`
  String get register_success {
    return Intl.message(
      'Registration success',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get login_fail {
    return Intl.message(
      'Login failed',
      name: 'login_fail',
      desc: '',
      args: [],
    );
  }

  /// `Theme setting`
  String get theme_setting {
    return Intl.message(
      'Theme setting',
      name: 'theme_setting',
      desc: '',
      args: [],
    );
  }

  /// `Night mode setting`
  String get theme_mode_setting {
    return Intl.message(
      'Night mode setting',
      name: 'theme_mode_setting',
      desc: '',
      args: [],
    );
  }

  /// `Follow the system setting`
  String get theme_mode_default {
    return Intl.message(
      'Follow the system setting',
      name: 'theme_mode_default',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get theme_mode_dark {
    return Intl.message(
      'Dark mode',
      name: 'theme_mode_dark',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get theme_mode_light {
    return Intl.message(
      'Light mode',
      name: 'theme_mode_light',
      desc: '',
      args: [],
    );
  }

  /// `Blue`
  String get theme_blue {
    return Intl.message(
      'Blue',
      name: 'theme_blue',
      desc: '',
      args: [],
    );
  }

  /// `Purple`
  String get theme_purple {
    return Intl.message(
      'Purple',
      name: 'theme_purple',
      desc: '',
      args: [],
    );
  }

  /// `Red`
  String get theme_red {
    return Intl.message(
      'Red',
      name: 'theme_red',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get theme_dark {
    return Intl.message(
      'Dark',
      name: 'theme_dark',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
