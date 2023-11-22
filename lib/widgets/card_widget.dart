import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final String tooltip;
  final void Function()? onTap;
  final Color? textColor;
  final Color? backgroundColor;

  const CardWidget({
    super.key,
    required this.child,
    this.tooltip = "",
    this.textColor = Colors.white,
    this.backgroundColor = Colors.black,
    this.onTap,
  });

  static const double borderRadius = 15;
  static const double cardWidth = 85;
  static const double cardHeight = 125;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
