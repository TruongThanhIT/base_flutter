import 'package:flutter/material.dart';

extension ColorExtension on Color {
  static const _primaryShade = 500;
  static const _shadeValues = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  Color get combineWhite40 => Color.alphaBlend(Colors.white.withOpacity(.4), this);

  Color get combineWhite50 => Color.alphaBlend(Colors.white.withOpacity(.5), this);

  Color get combineWhite70 => Color.alphaBlend(Colors.white.withOpacity(.7), this);

  Color get combineWhite75 => Color.alphaBlend(Colors.white.withOpacity(.75), this);

  Color get combineWhite90 => Color.alphaBlend(Colors.white.withOpacity(.9), this);

  Color get combineWhite10 => Color.alphaBlend(Colors.white.withOpacity(.1), this);

  MaterialColor get materialColor {
    final Map<int, Color> swatch = {};
    for (var shade in _shadeValues) {
      if (shade <= _primaryShade) {
        final double _opacity = 1.0 - (1.0 / _primaryShade.toDouble() * shade);
        swatch.putIfAbsent(shade, () => Color.alphaBlend(Colors.white.withOpacity(_opacity), this));
      } else {
        final double _opacity = 1.0 / _primaryShade.toDouble() * (shade - _primaryShade);
        swatch.putIfAbsent(shade, () => Color.alphaBlend(Colors.black.withOpacity(_opacity), this));
      }
    }

    return MaterialColor(value, swatch);
  }

  Color getColorFromShade(int shade) {
    final _materialColor = materialColor;
    final _shade = shade.clamp(_shadeValues.first, _shadeValues.last);
    final _valueIndex = _getCenter(0, _shadeValues.length - 1, _shade);

    switch (_valueIndex.clamp(0, _shadeValues.length - 1)) {
      case 0:
        return _materialColor.shade50;
      case 1:
        return _materialColor.shade100;
      case 2:
        return _materialColor.shade200;
      case 3:
        return _materialColor.shade300;
      case 4:
        return _materialColor.shade400;
      case 6:
        return _materialColor.shade600;
      case 7:
        return _materialColor.shade700;
      case 8:
        return _materialColor.shade800;
      case 9:
        return _materialColor.shade900;
    }
    return _materialColor.shade500;
  }

  int _getCenter(int from, int to, int value) {
    if (from >= 0 && from < _shadeValues.length && to >= 0 && to < _shadeValues.length && from < to) {
      if (_shadeValues[from] == value) return from;

      if (_shadeValues[to] == value) return to;

      if (from == to - 1) {
        final left = (_shadeValues[from] - value).abs();
        final right = (_shadeValues[to] - value).abs();
        return left >= right ? to : from;
      }

      final centerIndex = ((to - from) ~/ 2) + from;
      final centerValue = _shadeValues[centerIndex];
      if (value == centerValue) return centerIndex;

      if (value < centerValue) {
        return _getCenter(from, centerIndex, value);
      }

      return _getCenter(centerIndex + 1, to, value);
    }

    return -1;
  }

  String toHexString({bool includeHashSymbol = false}) => (includeHashSymbol ? '#' : '') + value.toRadixString(16);
}
