import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_icon.dart';

class CartWidget extends StatefulWidget {
  Products productDetail;
  final Function(int val) totalItemAddToCart;
  final Function(int val) totalItemRemoveToCart;

  CartWidget(
      {super.key,
      required this.productDetail,
      required this.totalItemAddToCart,
      required this.totalItemRemoveToCart});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int count = 1;

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
      child: Expanded(
        child: Row(
          children: [
            Image.network(
              widget.productDetail.image.toString(),
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
                    widget.productDetail.title!.substring(
                        0,
                        widget.productDetail.title!.length < 30
                            ? widget.productDetail.title!.length
                            : 30),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueColorAsset),
                  ),
                  SizedBox(
                    height: AppDimensions.height10,
                  ),
                  Text(
                    '₹ ${widget.productDetail.price.toString()}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 29, 60, 84)),
                  ),
                  SizedBox(
                    height: AppDimensions.height15,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        AppIconWidget(
                          icon: Icons.add,
                          size: AppDimensions.iconSize24,
                          onClick: () {
                            setState(() {
                              count++;
                            });
                            widget.totalItemAddToCart(count);
                          },
                        ),
                        SizedBox(
                          width: AppDimensions.width10,
                        ),
                        Text('${count < 1 ? 1 : count}'),
                        SizedBox(
                          width: AppDimensions.width10,
                        ),
                        AppIconWidget(
                          onClick: () {
                            setState(() {
                              if (count > 1) {
                                count--;
                              }
                            });
                            count > 1
                                ? widget.totalItemRemoveToCart(count)
                                : widget.totalItemRemoveToCart(1);
                            ;
                          },
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
      ),
    );
  }
}
