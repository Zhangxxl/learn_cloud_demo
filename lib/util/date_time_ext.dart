import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/28 0028
/// [email]    : zhangxx@yunjiacloud.com
extension DateTimeExt on DateTime {
  static const List<String> _defaultFormat = [yyyy, '-', MM, '-', dd, ' ', HH, ':', mm];

  String formatWithLocal(BuildContext context, [List<String> format = _defaultFormat]) {
    final locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case "zh":
        return formatDate(this, format, locale: DateTimeLocale());
      case "en":
        return formatDate(this, format);
      default:
        return formatDate(this, format);
    }
  }

  String format([List<String> format = _defaultFormat]) => formatDate(this, format, locale: DateTimeLocale());
}

class DateTimeLocale extends DateLocale {
  @override
  List<String> get daysLong => ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];

  @override
  List<String> get daysShort => ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];

  @override
  List<String> get monthsLong => ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

  @override
  List<String> get monthsShort => ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];

  @override
  String get am => "上午";

  @override
  String get pm => "下午";
}
