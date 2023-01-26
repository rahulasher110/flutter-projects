import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';

class ProductWidget extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final double rating;
  const ProductWidget(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.network(
              image,
              height: AppDimensions.height100,
            ),
            SizedBox(
              height: AppDimensions.height10,
            ),
            SizedBox(
              height: AppDimensions.height10,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyTextColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppDimensions.height10,
            ),
            Text(
              '₹ $price',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColorAsset),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: AppDimensions.height10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: AppDimensions.height15,
                ),
                Text(
                  ' (${rating.toString()})',
                  style: const TextStyle(color: AppColors.greyTextColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
