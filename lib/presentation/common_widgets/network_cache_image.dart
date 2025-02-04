import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkCacheImage extends StatelessWidget {
  final String imageUrl;
  final Color? color;
  final double? height;
  final double? width;
  final double radius;
  final Widget Function(BuildContext, String)? placeholder;
  final Alignment alignment;
  final BoxFit? boxFit;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Widget Function(BuildContext, ImageProvider)? imageBuilder;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const NetworkCacheImage(
      {super.key,
      required this.imageUrl,
      this.color,
      this.height,
      this.width,
      this.placeholder,
      this.alignment = Alignment.center,
      this.boxFit,
      this.errorWidget,
      this.imageBuilder,
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.radius = 0.0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.none,
      child: Container(
        padding: padding,
        margin: margin,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          color: color,
          height: height,
          width: width,
          placeholder: placeholder,
          alignment: alignment,
          fit: boxFit,
          errorWidget: errorWidget,
          imageBuilder: imageBuilder,
        ),
      ),
    );
  }
}
