import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yicbridge_aj_app/util/global.dart';

/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// [project]  : yicbridge_aj_app
/// [package]  :
/// [author]   : zhang
/// [date]     : 2021/6/23 0023
/// [email]    : zhangxx@yunjiacloud.com

class CacheUtils {
  CacheUtils._();

  static Future<String> getCacheSize() async {
    final Directory tempDir = await getTemporaryDirectory();
    final double value = await _getTotalSizeOfFilesInDir(tempDir);
    return _renderSize(value);
  }

  static Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      final int length = await file.length();
      return length.toDouble();
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await _getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  }

  static String _renderSize(double value) {
    final List<String> unitArr = ['B', 'K', 'M', 'G', 'T'];
    int index = 0;
    while (value > 1024 && index < unitArr.length - 1) {
      index++;
      value /= 1024;
    }
    final String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  static Future<bool> clearCache() async {
    final Directory tempDir = await getTemporaryDirectory();
    try {
      await delDir(tempDir);
      await getCacheSize();
      return true;
    } catch (e) {
      logger.e(e);
      EasyLoading.showToast("文件系统异常");
      return false;
    }
  }

  ///递归方式删除目录
  static Future<void> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }
}
