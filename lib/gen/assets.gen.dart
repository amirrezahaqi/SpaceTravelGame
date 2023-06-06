/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage aboutmee = AssetGenImage('assets/Aboutmee.png');
  static const AssetGenImage records = AssetGenImage('assets/Records.png');
  static const AssetGenImage scores = AssetGenImage('assets/Scores.png');
  static const AssetGenImage about = AssetGenImage('assets/about.png');
  static const AssetGenImage astronaut = AssetGenImage('assets/astronaut.png');
  static const AssetGenImage bg = AssetGenImage('assets/bg.png');
  static const AssetGenImage createdbyamir1 =
      AssetGenImage('assets/createdbyamir1.png');
  static const AssetGenImage earth1 = AssetGenImage('assets/earth1.jpg');
  static const AssetGenImage gameover = AssetGenImage('assets/gameover.png');
  static const AssetGenImage github = AssetGenImage('assets/github.png');
  static const AssetGenImage greenufo1 = AssetGenImage('assets/greenufo1.png');
  static const AssetGenImage instagram = AssetGenImage('assets/instagram.png');
  static const AssetGenImage linkedin = AssetGenImage('assets/linkedin.png');
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');
  static const AssetGenImage twitter = AssetGenImage('assets/twitter.png');
  static const AssetGenImage website = AssetGenImage('assets/website.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        aboutmee,
        records,
        scores,
        about,
        astronaut,
        bg,
        createdbyamir1,
        earth1,
        gameover,
        github,
        greenufo1,
        instagram,
        linkedin,
        logo,
        twitter,
        website
      ];
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
