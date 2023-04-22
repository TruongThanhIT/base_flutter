import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseSvgPicture extends StatelessWidget {
  final String assetName;
  final double? width, height;
  final Color? color;
  final BoxFit fit;
  final bool isNetwork;

  const BaseSvgPicture(
    this.assetName, {
    Key? key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.isNetwork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isNetwork) {
      return SvgPicture.network(
        assetName,
        width: width,
        height: height,
        color: color,
        fit: fit,
      );
    }

    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      color: color,
      fit: fit,
    );
  }
}
