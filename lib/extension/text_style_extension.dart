import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get thin => weight(FontWeight.w100);

  TextStyle get extraLight => weight(FontWeight.w200);

  TextStyle get light => weight(FontWeight.w300);

  TextStyle get regular => weight(FontWeight.w400);

  TextStyle get medium => weight(FontWeight.w500);

  TextStyle get semiBold => weight(FontWeight.w600);

  TextStyle get bold => weight(FontWeight.w700);

  TextStyle get extraBold => weight(FontWeight.w800);

  TextStyle get black => weight(FontWeight.w900);

  TextStyle get italic => fontStyle(FontStyle.italic);

  TextStyle get normal => fontStyle(FontStyle.normal);

  TextStyle size([double? v]) {
    if (v != null && v >= 0) {
      return copyWith(fontSize: v);
    }
    return this;
  }

  TextStyle offsetSize(
    double offset, [
    String? fontFamily,
    String? packageName,
  ]) {
    final currentSize = fontSize;
    if (currentSize != null) {
      var newFontSize = (currentSize + offset).toInt();
      if (newFontSize < 1) {
        newFontSize = 1;
      }

      return copyWith(
        fontSize: newFontSize.toDouble(),
        fontFamily: fontFamily,
        package: packageName,
      );
    }

    return copyWith(package: packageName);
  }

  TextStyle setLetterSpacing(double v) => copyWith(letterSpacing: v);

  TextStyle textColor(Color v) => copyWith(color: v);

  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  TextStyle fontStyle(FontStyle v) => copyWith(fontStyle: v);

  TextStyle decoration(TextDecoration v) => copyWith(decoration: v);

  TextStyle fontFamilies(
    String v, {
    String? package,
  }) =>
      copyWith(fontFamily: v, package: package);

  TextStyle setBackgroundColor(Color color) => copyWith(backgroundColor: color);

  TextStyle setPackage(String? package) => copyWith(package: package);
}
