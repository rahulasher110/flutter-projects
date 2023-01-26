import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';

class ProductWidget extends StatefulWidget {
  final String image;
  final String title;
  final double price;
  final double rating;
  final String? selectedCategory;
  final String category;
  final Function(bool val) isLiked;
  const ProductWidget(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.rating,
      required this.isLiked,
      this.selectedCategory,
      required this.category});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: widget.selectedCategory == widget.category ? 20 : 0,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimensions.radius20)),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppDimensions.radius20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.network(
                    widget.image,
                    height: AppDimensions.height100,
                  ),
                  SizedBox(
                    height: AppDimensions.height10,
                  ),
                  SizedBox(
                    height: AppDimensions.height10,
                  ),
                  Text(
                    widget.title.substring(
                        0, widget.title.length < 30 ? widget.title.length : 30),
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
                    '₹ ${widget.price}',
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
                        rating: widget.rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: AppDimensions.height15,
                      ),
                      Text(
                        ' (${widget.rating.toString()})',
                        style: const TextStyle(color: AppColors.greyTextColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: AppDimensions.height10,
          top: AppDimensions.height10,
          child: FavoriteButton(
            isFavorite: true,
            iconSize: 32,
            iconDisabledColor: Colors.red,
            iconColor: Colors.grey,
            valueChanged: (v) {
              widget.isLiked(!v);
            },
          ),
        ),
      ],
    );
  }
}
