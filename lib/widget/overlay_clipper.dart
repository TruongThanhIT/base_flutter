import 'package:flutter/material.dart';

/*
How to use:
    Stack(
      children: [
        Positioned.fill(child: YourFullView()),
        Positioned.fill(
          child: IgnorePointer(
            child: ClipPath(
              clipper: OverlayClipper(
                cornerRadius: 12.0,
                aspectRatio: 16 / 9,
              ),
              child: Container(color: Colors.black38),
            ),
          ),
        ),
      ],
    )
*/

class OverlayClipper extends CustomClipper<Path> {
  OverlayClipper({
    this.aspectRatio = 1.0,
    this.cornerRadius = 0.0,
    this.horizontalPadding = 32.0,
  })  : assert(aspectRatio > 0),
        assert(cornerRadius >= 0),
        assert(horizontalPadding >= 0),
        super();

  final double aspectRatio;
  final double cornerRadius;
  final double horizontalPadding;

  @override
  Path getClip(Size size) {
    final clipperWidth = size.shortestSide - horizontalPadding;
    final clipperHeight = clipperWidth * (1 / aspectRatio);

    final x = (size.width - clipperWidth) / 2;
    final y = (size.height - clipperHeight) / 2;

    final path = Path();
    path
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(x, y, clipperWidth, clipperHeight),
        bottomLeft: Radius.circular(cornerRadius),
        topLeft: Radius.circular(cornerRadius),
        bottomRight: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
      ))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
