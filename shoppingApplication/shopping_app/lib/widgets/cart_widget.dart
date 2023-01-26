import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_icon.dart';

class CartWidget extends StatelessWidget {
  Products productDetail;
  CartWidget({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.width15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radius30),
          color: AppColors.whiteColor),
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.horizontalPadding, vertical: 6),
      height: AppDimensions.height150,
      child: Row(
        children: [
          Image.network(
            productDetail.image.toString(),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: AppDimensions.width30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productDetail.title.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueColorAsset),
                ),
                SizedBox(
                  height: AppDimensions.height10,
                ),
                Text(
                  '₹ ${productDetail.price.toString()}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 29, 60, 84)),
                ),
                SizedBox(
                  height: AppDimensions.height15,
                ),
                Container(
                  child: Row(
                    children: [
                      AppIconWidget(
                        icon: Icons.add,
                        size: AppDimensions.iconSize24,
                      ),
                      SizedBox(
                        width: AppDimensions.width10,
                      ),
                      Text('1'),
                      SizedBox(
                        width: AppDimensions.width10,
                      ),
                      AppIconWidget(
                        icon: Icons.remove,
                        backgroundColor: AppColors.greyShadow,
                        iconColor: AppColors.blueColorAsset,
                        size: AppDimensions.iconSize24,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
