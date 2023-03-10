import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopping_app/boxes/box.dart';
import 'package:shopping_app/models/hive_models.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/views/dashboard/cart_list.dart';
import 'package:shopping_app/widgets/app_icon.dart';

class ProductDescription extends StatefulWidget {
  final Products itemDescription;
  const ProductDescription({super.key, required this.itemDescription});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  final List<ProductsModels> itemsAdd = [];
  final box = Boxes.getData();
  int count = 0;
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    for (var item in box.values.toList()) {
      if (item.id == widget.itemDescription.id) {
        quantity = item.quantity!.toInt();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: AppDimensions.height350,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            widget.itemDescription.image.toString()))),
              )),
          Positioned(
              top: AppDimensions.height45,
              left: AppDimensions.width20,
              right: AppDimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconWidget(
                    onClick: () => Get.back(),
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIconWidget(
                      icon: Icons.shopping_cart_outlined,
                      onClick: () => Get.to(CartList(
                            itemQuantity: (val) {
                              setState(() {
                                quantity = val;
                              });
                            },
                          )))
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: AppDimensions.height350 - AppDimensions.height30,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: AppDimensions.width20,
                    right: AppDimensions.width20,
                    top: AppDimensions.width20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 223, 223),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radius20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemDescription.title.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 36, 96, 141),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                    ),
                    Text(
                      widget.itemDescription.description.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 54, 109, 152),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: AppDimensions.height20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBarIndicator(
                          rating:
                              widget.itemDescription.rating!.rate!.toDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 7, 85, 255),
                          ),
                          itemCount: 5,
                          itemSize: AppDimensions.height15,
                        ),
                        Text(
                          ' (${widget.itemDescription.rating!.rate.toString()})',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 146, 146, 146)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.height30,
                    ),
                    Text(
                      'Number of items added to cart : $quantity',
                      style: TextStyle(fontSize: AppDimensions.font20),
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radius20)),
                padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '??? ${widget.itemDescription.price.toString()}',
                      style: TextStyle(
                          fontSize: AppDimensions.font28,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 36, 96, 141)),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (quantity < 1) {
                            final data = ProductsModels(
                                id: widget.itemDescription.id,
                                title: widget.itemDescription.title,
                                price: widget.itemDescription.price,
                                image: widget.itemDescription.image,
                                category: widget.itemDescription.category,
                                description: widget.itemDescription.description,
                                quantity: 1);
                            box.add(data);
                            data.save();
                            quantity++;
                          } else {
                            increaseQuantity(
                                widget.itemDescription.id!.toInt());
                            quantity++;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 223, 223, 223),
                            borderRadius:
                                BorderRadius.circular(AppDimensions.radius20)),
                        padding: const EdgeInsets.all(
                            AppDimensions.horizontalPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppIconWidget(icon: Icons.shopping_cart_outlined),
                            SizedBox(
                              width: AppDimensions.width10,
                            ),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                  fontSize: AppDimensions.font16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void increaseQuantity(int id) async {
    final box = Boxes.getData();
    var data = box.values.toList().cast<ProductsModels>();

    if (data.isNotEmpty) {
      for (var item in data) {
        if (item.id == id) {
          item.quantity = item.quantity! + 1;
        }
      }
    }
  }
}
