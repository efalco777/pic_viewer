import 'package:flutter/cupertino.dart';

class FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;
  final Widget child;

  FixedHeaderDelegate({
    required double extend,
    required this.child,
  })  : minExtent = extend,
        maxExtent = extend;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double offset = maxExtent - shrinkOffset;
    final double percentageExpanded = offset / maxExtent;
    final double height = minExtent + (maxExtent - minExtent) * percentageExpanded;
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  bool shouldRebuild(FixedHeaderDelegate oldDelegate) {
    return minExtent != oldDelegate.minExtent || maxExtent != oldDelegate.maxExtent || child != oldDelegate.child;
  }
}
