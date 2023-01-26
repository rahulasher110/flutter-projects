import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDimensions {
  static double screenHeight = Get.height;
  static double screenWidth = Get.width;

  static double height10 = screenHeight / 84.4;
  static double height20 = screenHeight / 42.2;
  static double height15 = screenHeight / 56.27;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;
  static double height100 = screenHeight / 8.44;
  static double height150 = screenHeight / 5.60;
  static double height200 = screenHeight / 4.22;
  static double height300 = screenHeight / 2.81;
  static double height350 = screenHeight / 2.41;

  static double width10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width15 = screenHeight / 56.27;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.75;

  static double font20 = screenHeight / 42.2;
  static double font12 = screenHeight / 70.33;
  static double font16 = screenHeight / 52.75;
  static double font32 = screenHeight / 26.37;
  static double font28 = screenHeight / 30.14;

  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
  static double radius15 = screenHeight / 56.27;
  static double radius12 = screenHeight / 70.3;

  static double iconsSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize20 = screenHeight / 42.2;

  static double welcomePageContainerHeight = screenHeight / 2.81;

  static const horizontalPadding = 20.0;
  static EdgeInsets pagePadding =
      const EdgeInsets.symmetric(horizontal: horizontalPadding);
}
