import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/views/authentication/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> listOfImage = [
    Image.asset(AppAssets.welcomeImage1),
    Image.asset(AppAssets.welcomeImage2),
    Image.asset(AppAssets.welcomeImage3),
    Image.asset(AppAssets.welcomeImage4),
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: AppDimensions.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppDimensions.welcomePageContainerHeight,
              width: double.infinity,
              padding: EdgeInsets.only(top: AppDimensions.height45),
              child: PageView(
                physics: const BouncingScrollPhysics(),
                children: listOfImage,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: AppDimensions.height20,
            ),
            CarouselIndicator(
              count: listOfImage.length,
              index: pageIndex,
              color: AppColors.greyTextColor.withOpacity(0.3),
              activeColor: AppColors.primaryColor,
            ),
            SizedBox(
              height: AppDimensions.height45,
            ),
            const Text(
              'Why waste time searching a store from wall to wall, aisle to aisle, use Text to Shop to help get you in & out fast! Get a text to pickup a few items on your way home, copy and paste and find it fast, you get in and out of the store fast with all the items you are looking for!',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.greyTextColor),
            ),
            SizedBox(
              height: AppDimensions.height45,
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius30)),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.width20, vertical: 20),
                  ),
                  onPressed: () => Get.to(const LoginPage()),
                  child: const Text(
                    'Welcome To our Shopping Hub!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
