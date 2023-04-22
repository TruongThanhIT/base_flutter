import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BaseNetworkImageWidget extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? ratio;
  final BorderRadius? radius;
  final BoxShape shape;
  final double? width;
  final double? height;
  final Widget Function(BuildContext context)? errorBuilder;

  const BaseNetworkImageWidget({
    Key? key,
    required this.url,
    this.fit,
    this.ratio,
    this.radius,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AspectRatio(
        aspectRatio: ratio ?? 1.0,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.zero,
          elevation: 0.0,
          color: Colors.transparent,
          shape: shape == BoxShape.rectangle
              ? RoundedRectangleBorder(borderRadius: radius ?? BorderRadius.zero)
              : const CircleBorder(),
          child: url.isEmpty
              ? _buildError(context)
              : CachedNetworkImage(
                  imageUrl: _url,
                  fit: fit,
                  errorWidget: (context, __, ___) => _buildError(context),
                  placeholder: (context, _) => Shimmer.fromColors(
                    baseColor: const Color(0xFFEEEEEE),
                    highlightColor: const Color(0xFFFAFAFA),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCCCCC),
                        borderRadius: radius,
                        shape: shape,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return errorBuilder?.call(context) ?? Container(color: Theme.of(context).dividerColor);
  }

  String get _url {
    if (url.trim().isEmpty) return url;

    var s = url.trim().replaceAll('https://', '');
    s = s.trim().replaceAll('http://', '');

    return 'https://$s';
  }
}
