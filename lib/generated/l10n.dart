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

  /// `An unknown error`
  String get unknownError {
    return Intl.message(
      'An unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Abnormal network connection`
  String get networkError {
    return Intl.message(
      'Abnormal network connection',
      name: 'networkError',
      desc: '',
      args: [],
    );
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

  /// `Please wait...`
  String get waiting {
    return Intl.message(
      'Please wait...',
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

  /// `message`
  String get message {
    return Intl.message(
      'message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `moments posts`
  String get moments_posts {
    return Intl.message(
      'moments posts',
      name: 'moments_posts',
      desc: '',
      args: [],
    );
  }

  /// `workstation`
  String get work_station {
    return Intl.message(
      'workstation',
      name: 'work_station',
      desc: '',
      args: [],
    );
  }

  /// `mine`
  String get mine {
    return Intl.message(
      'mine',
      name: 'mine',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get empty_content {
    return Intl.message(
      'No more data',
      name: 'empty_content',
      desc: '',
      args: [],
    );
  }

  /// `Clear cache only supports mobile platforms`
  String get clean_cache_warning {
    return Intl.message(
      'Clear cache only supports mobile platforms',
      name: 'clean_cache_warning',
      desc: '',
      args: [],
    );
  }

  /// `Clear cache`
  String get clean_cache {
    return Intl.message(
      'Clear cache',
      name: 'clean_cache',
      desc: '',
      args: [],
    );
  }

  /// `Confirm that you wan clean cache?`
  String get confirm_clean_cache {
    return Intl.message(
      'Confirm that you wan clean cache?',
      name: 'confirm_clean_cache',
      desc: '',
      args: [],
    );
  }

  /// `Please wait`
  String get please_wait {
    return Intl.message(
      'Please wait',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `Clean`
  String get clean {
    return Intl.message(
      'Clean',
      name: 'clean',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get btn_ok {
    return Intl.message(
      'OK',
      name: 'btn_ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get btn_cancel {
    return Intl.message(
      'Cancel',
      name: 'btn_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get info_success {
    return Intl.message(
      'Success',
      name: 'info_success',
      desc: '',
      args: [],
    );
  }

  /// `Fail`
  String get info_fail {
    return Intl.message(
      'Fail',
      name: 'info_fail',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get modify_password {
    return Intl.message(
      'Change password',
      name: 'modify_password',
      desc: '',
      args: [],
    );
  }

  /// `Check for updates`
  String get check_update {
    return Intl.message(
      'Check for updates',
      name: 'check_update',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get about_us {
    return Intl.message(
      'About us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Version: {versionName}({versionCode})`
  String version_message(Object versionName, Object versionCode) {
    return Intl.message(
      'Version: $versionName($versionCode)',
      name: 'version_message',
      desc: '',
      args: [versionName, versionCode],
    );
  }

  /// `Logging in...`
  String get login_loading {
    return Intl.message(
      'Logging in...',
      name: 'login_loading',
      desc: '',
      args: [],
    );
  }

  /// `New user registration`
  String get user_register {
    return Intl.message(
      'New user registration',
      name: 'user_register',
      desc: '',
      args: [],
    );
  }

  /// `File system error`
  String get file_error {
    return Intl.message(
      'File system error',
      name: 'file_error',
      desc: '',
      args: [],
    );
  }

  /// `Refresh successfully`
  String get refresh_complete {
    return Intl.message(
      'Refresh successfully',
      name: 'refresh_complete',
      desc: '',
      args: [],
    );
  }

  /// `Last refresh：%T`
  String get last_refresh_info {
    return Intl.message(
      'Last refresh：%T',
      name: 'last_refresh_info',
      desc: '',
      args: [],
    );
  }

  /// `No more`
  String get no_more {
    return Intl.message(
      'No more',
      name: 'no_more',
      desc: '',
      args: [],
    );
  }

  /// `Refresh failed`
  String get refresh_fail {
    return Intl.message(
      'Refresh failed',
      name: 'refresh_fail',
      desc: '',
      args: [],
    );
  }

  /// `Refreshing`
  String get refreshing {
    return Intl.message(
      'Refreshing',
      name: 'refreshing',
      desc: '',
      args: [],
    );
  }

  /// `Pull down to refresh`
  String get pull_down_to_refresh {
    return Intl.message(
      'Pull down to refresh',
      name: 'pull_down_to_refresh',
      desc: '',
      args: [],
    );
  }

  /// `Release to refresh`
  String get release_to_refresh {
    return Intl.message(
      'Release to refresh',
      name: 'release_to_refresh',
      desc: '',
      args: [],
    );
  }

  /// `Loading completed`
  String get load_complete {
    return Intl.message(
      'Loading completed',
      name: 'load_complete',
      desc: '',
      args: [],
    );
  }

  /// `Last loaded：%T`
  String get last_load_info {
    return Intl.message(
      'Last loaded：%T',
      name: 'last_load_info',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load`
  String get load_fail {
    return Intl.message(
      'Failed to load',
      name: 'load_fail',
      desc: '',
      args: [],
    );
  }

  /// `Pull up to loading`
  String get pull_up_to_load {
    return Intl.message(
      'Pull up to loading',
      name: 'pull_up_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Release to load`
  String get release_to_load {
    return Intl.message(
      'Release to load',
      name: 'release_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Safely log out`
  String get login_out_safely {
    return Intl.message(
      'Safely log out',
      name: 'login_out_safely',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Automatic`
  String get language_auto {
    return Intl.message(
      'Automatic',
      name: 'language_auto',
      desc: '',
      args: [],
    );
  }

  /// `Post content`
  String get post_content {
    return Intl.message(
      'Post content',
      name: 'post_content',
      desc: '',
      args: [],
    );
  }

  /// `Please enter content`
  String get please_enter_content {
    return Intl.message(
      'Please enter content',
      name: 'please_enter_content',
      desc: '',
      args: [],
    );
  }

  /// `post`
  String get post {
    return Intl.message(
      'post',
      name: 'post',
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
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
