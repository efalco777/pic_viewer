import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImagePlaceholder extends StatelessWidget {
  final double? width;
  final double? height;

  const ImagePlaceholder({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (width != null || height != null) {
      return _Shimmer(
        width: width,
        height: height,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return _Shimmer(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        );
      },
    );
  }
}

class _Shimmer extends StatelessWidget {
  final double? width;
  final double? height;

  const _Shimmer({
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey[200]!,
      child: Container(
        color: Colors.white,
        width: width,
        height: height,
      ),
    );
  }
}
