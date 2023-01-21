import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoomclone/utils/colors.dart';
import 'package:zoomclone/utils/dimension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  double? fontSize = AppDimensions.font16;
  CustomButton(
      {super.key, required this.text, required this.onPressed, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius30)),
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: AppColors.buttonColor),
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize ?? AppDimensions.font20),
        ),
      ),
    );
  }
}
