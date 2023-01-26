import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/utils/dimensions.dart';

class AppIconWidget extends StatefulWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final VoidCallback? onClick;

  AppIconWidget(
      {super.key,
      required this.icon,
      this.size = 40,
      this.iconColor = Colors.white,
      this.backgroundColor = Colors.blue,
      this.onClick});

  @override
  State<AppIconWidget> createState() => _AppIconWidgetState();
}

class _AppIconWidgetState extends State<AppIconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.size / 2),
            color: widget.backgroundColor),
        child: Icon(
          widget.icon,
          color: widget.iconColor,
          size: AppDimensions.iconSize20,
        ),
      ),
    );
  }
}
