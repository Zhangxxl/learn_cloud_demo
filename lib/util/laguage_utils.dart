import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../generated/assets.gen.dart';
import '../generated/l10n.dart';
import 'ext/map_ext.dart';
import 'global.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/10/12 0010
/// [email]    : zhangxx@yunjiacloud.com

final RegExp languageSeparator = RegExp(r"[\-_]");

class LanguageUtils {
  LanguageUtils._internal();

  static LanguageUtils? _instance;

  static SupportLanguage getAutoLocale(BuildContext context) => SupportLanguage(code: "und", name: S.of(context).language_auto, locale: Localizations.localeOf(context));

  static LanguageUtils getInstance() {
    _instance ??= LanguageUtils._internal();
    return _instance!;
  }

  void setLanguage(SupportLanguage l) {
    sp.setString(Constant.SP_KEY_LANGUAGE, l.code);
    sp.setString(Constant.SP_KEY_LANGUAGE_NAME, l.name);
    changeLocale(l.locale);
  }

  SupportLanguage? getLanguage() {
    final String? code = sp.getString(Constant.SP_KEY_LANGUAGE);
    final String? name = sp.getString(Constant.SP_KEY_LANGUAGE_NAME);
    if (code == null || name == null) {
      return null;
    }
    return SupportLanguage.parse(code: code, name: name);
  }

  void changeLocale(Locale l) {
    Get.locale = l;
    S.load(l);
    Get.forceAppUpdate();
  }

  Locale? getLocale(BuildContext context) => Localizations.localeOf(context);

  Future<Map<String, dynamic>> get localJson async => json.decode(await rootBundle.loadString(Assets.resources.text.supportLanguages));

  Future<List<SupportLanguage>> getSupportLocal() async {
    final List<SupportLanguage> support = [];
    for (final element in S.delegate.supportedLocales) {
      final language = (await localJson).findFirst((k, v) {
        logger.i("k: $k, v: $v, element.countryCode: ${element.countryCode}, element.countryCode: ${element.countryCode}");
        return (element.countryCode == null && k == element.languageCode) ||
            RegExp("${element.languageCode}$languageSeparator${element.countryCode}").hasMatch(k);
      });
      if (language != null) {
        support.add(SupportLanguage.parse(code: language.key, name: language.value));
      }
    }
    return support;
  }
}

class SupportLanguage {
  const SupportLanguage({required this.name, required this.code, required this.locale});
  SupportLanguage.parse({required this.name, required this.code}) : locale = _getLocale(code);

  final String name;
  final String code;

  final Locale locale;

  static Locale _getLocale(final String code) {
    final String languageCode;
    final String? countryCode;
    if (languageSeparator.hasMatch(code)) {
      final codeList = code.split(languageSeparator);
      languageCode = codeList[0];
      countryCode = codeList[1];
    } else {
      languageCode = code;
      countryCode = null;
    }
    return Locale(languageCode, countryCode);
  }
}
