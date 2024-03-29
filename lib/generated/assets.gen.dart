/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $ResourcesGen {
  const $ResourcesGen();

  $ResourcesImageGen get image => const $ResourcesImageGen();
  $ResourcesTextGen get text => const $ResourcesTextGen();
}

class $ResourcesImageGen {
  const $ResourcesImageGen();

  /// File path: resources/image/ic_about_me.webp
  AssetGenImage get icAboutMe => const AssetGenImage('resources/image/ic_about_me.webp');

  /// File path: resources/image/ic_check_update.webp
  AssetGenImage get icCheckUpdate => const AssetGenImage('resources/image/ic_check_update.webp');

  /// File path: resources/image/ic_clean.webp
  AssetGenImage get icClean => const AssetGenImage('resources/image/ic_clean.webp');

  /// File path: resources/image/ic_clean_cache.webp
  AssetGenImage get icCleanCache => const AssetGenImage('resources/image/ic_clean_cache.webp');

  /// File path: resources/image/ic_home.webp
  AssetGenImage get icHome => const AssetGenImage('resources/image/ic_home.webp');

  /// File path: resources/image/ic_mine.webp
  AssetGenImage get icMine => const AssetGenImage('resources/image/ic_mine.webp');

  /// File path: resources/image/ic_modify_pwd.webp
  AssetGenImage get icModifyPwd => const AssetGenImage('resources/image/ic_modify_pwd.webp');

  /// File path: resources/image/ic_notice.webp
  AssetGenImage get icNotice => const AssetGenImage('resources/image/ic_notice.webp');

  /// File path: resources/image/ic_splash.webp
  AssetGenImage get icSplash => const AssetGenImage('resources/image/ic_splash.webp');

  /// File path: resources/image/ic_splash_word.webp
  AssetGenImage get icSplashWord => const AssetGenImage('resources/image/ic_splash_word.webp');

  /// File path: resources/image/ic_system_bzf.webp
  AssetGenImage get icSystemBzf => const AssetGenImage('resources/image/ic_system_bzf.webp');

  /// File path: resources/image/ic_system_hmcs.webp
  AssetGenImage get icSystemHmcs => const AssetGenImage('resources/image/ic_system_hmcs.webp');

  /// File path: resources/image/ic_system_jzgyh.webp
  AssetGenImage get icSystemJzgyh => const AssetGenImage('resources/image/ic_system_jzgyh.webp');

  /// File path: resources/image/ic_system_jzjn.webp
  AssetGenImage get icSystemJzjn => const AssetGenImage('resources/image/ic_system_jzjn.webp');

  /// File path: resources/image/ic_system_jzyqy.webp
  AssetGenImage get icSystemJzyqy => const AssetGenImage('resources/image/ic_system_jzyqy.webp');

  /// File path: resources/image/ic_system_xfjg.webp
  AssetGenImage get icSystemXfjg => const AssetGenImage('resources/image/ic_system_xfjg.webp');

  /// File path: resources/image/ic_system_zajg.webp
  AssetGenImage get icSystemZajg => const AssetGenImage('resources/image/ic_system_zajg.webp');

  /// File path: resources/image/ic_work.webp
  AssetGenImage get icWork => const AssetGenImage('resources/image/ic_work.webp');

  /// File path: resources/image/icon_empty_dynamic.jpg
  AssetGenImage get iconEmptyDynamic => const AssetGenImage('resources/image/icon_empty_dynamic.jpg');
}

class $ResourcesTextGen {
  const $ResourcesTextGen();

  /// File path: resources/text/learn_cloud_key.json
  String get learnCloudKey => 'resources/text/learn_cloud_key.json';

  /// File path: resources/text/support_languages.json
  String get supportLanguages => 'resources/text/support_languages.json';
}

class Assets {
  Assets._();

  static const $ResourcesGen resources = $ResourcesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
