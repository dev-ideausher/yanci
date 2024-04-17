import 'package:flutter/material.dart';
import 'hexColorToFlutterColor.dart';

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? Color(light) : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get whiteColor => dynamicColour(light: HexColor("#FFFFFF"), dark: HexColor("#FFFFFF"));

  Color get blackColor => dynamicColour(light: HexColor("#000000"), dark: HexColor("#000000"));

  Color get brandColor1 => dynamicColour(light: HexColor("#5D48D0"), dark: HexColor("#000000"));

  Color get brandColor2 => dynamicColour(light: HexColor("#8032A8"), dark: HexColor("#000000"));

  Color get kcPrimaryColor => dynamicColour(light: HexColor("#35BAB2"), dark: HexColor("#000000"));

  Color get kcPrimaryLight => dynamicColour(light: HexColor("#F6FFFC"), dark: HexColor("#F6FFFC"));

  Color get dotNotActive => dynamicColour(light: HexColor("#D9D9D9"), dark: HexColor("#000000"));

  Color get subtitleColor => dynamicColour(light: HexColor("#585858"), dark: HexColor("#000000"));

  Color get dividerColor => dynamicColour(light: HexColor("#787878"), dark: HexColor("#000000"));

  Color get greyTextColor => dynamicColour(light: HexColor("#898989"), dark: HexColor("#000000"));

  Color get greyColor => dynamicColour(light: HexColor("#D9D9D9"), dark: HexColor("#D9D9D9"));

  Color get kGreyBack => dynamicColour(light: HexColor("#FCF7F7"), dark: HexColor("#FCF7F7"));

  Color get kNotActive => dynamicColour(light: HexColor("#abb7ba"), dark: HexColor("#abb7ba"));

  Color get disabledColor => dynamicColour(light: HexColor("#B5B5B5"), dark: HexColor("#B5B5B5"));

  Color get kWhitelight => dynamicColour(light: HexColor("#F4F4F4"), dark: HexColor("#F4F4F4"));

  Color get borderColor => dynamicColour(light: HexColor("#C9C9C9"), dark: HexColor("#C9C9C9"));

  Color get redColor => dynamicColour(light: HexColor("#FA5E49"), dark: HexColor("#FA5E49"));
}
