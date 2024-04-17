/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appleLogo.png
  AssetGenImage get appleLogo =>
      const AssetGenImage('assets/images/appleLogo.png');

  /// File path: assets/images/googleLogo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/images/googleLogo.png');

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/onboarding4.png
  AssetGenImage get onboarding4 =>
      const AssetGenImage('assets/images/onboarding4.png');

  /// File path: assets/images/successful.png
  AssetGenImage get successful =>
      const AssetGenImage('assets/images/successful.png');

  /// File path: assets/images/yahooLogo.png
  AssetGenImage get yahooLogo =>
      const AssetGenImage('assets/images/yahooLogo.png');

  /// File path: assets/images/yanciLogo.png
  AssetGenImage get yanciLogo =>
      const AssetGenImage('assets/images/yanciLogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appleLogo,
        googleLogo,
        onboarding1,
        onboarding2,
        onboarding3,
        onboarding4,
        successful,
        yahooLogo,
        yanciLogo
      ];
}

class $AssetsLottiefilesGen {
  const $AssetsLottiefilesGen();

  /// File path: assets/lottiefiles/carUpdate.json
  String get carUpdate => 'assets/lottiefiles/carUpdate.json';

  /// File path: assets/lottiefiles/inAppUpdate.json
  String get inAppUpdate => 'assets/lottiefiles/inAppUpdate.json';

  /// List of all assets
  List<String> get values => [carUpdate, inAppUpdate];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/appleLogo.svg
  SvgGenImage get appleLogo => const SvgGenImage('assets/svg/appleLogo.svg');

  /// File path: assets/svg/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/svg/camera.svg');

  /// File path: assets/svg/camera_border.svg
  SvgGenImage get cameraBorder =>
      const SvgGenImage('assets/svg/camera_border.svg');

  /// File path: assets/svg/files.svg
  SvgGenImage get files => const SvgGenImage('assets/svg/files.svg');

  /// File path: assets/svg/gallery.svg
  SvgGenImage get gallery => const SvgGenImage('assets/svg/gallery.svg');

  /// File path: assets/svg/googleLogo.svg
  SvgGenImage get googleLogo => const SvgGenImage('assets/svg/googleLogo.svg');

  /// File path: assets/svg/select_file.svg
  SvgGenImage get selectFile => const SvgGenImage('assets/svg/select_file.svg');

  /// File path: assets/svg/yahooLogo.svg
  SvgGenImage get yahooLogo => const SvgGenImage('assets/svg/yahooLogo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appleLogo,
        camera,
        cameraBorder,
        files,
        gallery,
        googleLogo,
        selectFile,
        yahooLogo
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiefilesGen lottiefiles = $AssetsLottiefilesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
