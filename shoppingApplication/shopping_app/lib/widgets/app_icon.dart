import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/utils/dimensions.dart';

class AppIconWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIconWidget(
      {super.key,
      required this.icon,
      this.size = 40,
      this.iconColor = Colors.white,
      this.backgroundColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: AppDimensions.iconSize20,
      ),
    );
  }
}
