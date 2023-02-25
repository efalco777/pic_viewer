import 'package:flutter/material.dart';

class TogglableButtonChip<T> extends StatelessWidget {
  final double size;
  final double? fontSize;
  final BoxShape? shape;
  final T value;
  final T groupValue;
  final String label;
  final ValueChanged<T> valueChanged;

  const TogglableButtonChip({
    Key? key,
    this.size = 36,
    this.fontSize,
    this.shape,
    required this.label,
    required this.valueChanged,
    required this.value,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => valueChanged(value),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _backgroundColor(context),
              shape: shape ?? BoxShape.circle,
            ),
            width: size,
            height: size,
            child: Text(
              label.toString(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: _getFontWeight(),
                    fontSize: fontSize,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Color _backgroundColor(BuildContext context) {
    if (value == groupValue) {
      return Theme.of(context).primaryColor;
    }

    return Theme.of(context).primaryColor.withOpacity(0.75);
  }

  FontWeight _getFontWeight() {
    if (value == groupValue) {
      return FontWeight.bold;
    }

    return FontWeight.normal;
  }
}
