import 'package:flutter/material.dart';

class UpdatableContent extends StatelessWidget {
  final Widget child;
  final bool isUpdating;

  const UpdatableContent({
    super.key,
    required this.isUpdating,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        if (isUpdating)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isUpdating ? 1.0 : 0,
            child: ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
