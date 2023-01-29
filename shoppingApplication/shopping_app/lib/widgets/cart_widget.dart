import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/boxes/box.dart';
import 'package:shopping_app/models/hive_models.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_icon.dart';

class CartWidget extends StatefulWidget {
  ProductsModels productDetail;
  final Function(double val) totalItemAddToCart;
  final Function(double val, int quant) totalItemRemoveToCart;
  final Function(bool removeItem, int count, double val)? removeItem;

  CartWidget({
    super.key,
    required this.productDetail,
    required this.totalItemAddToCart,
    required this.totalItemRemoveToCart,
    this.removeItem,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  bool reduceItem = false;

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
            widget.productDetail.image.toString(),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: AppDimensions.width30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppDimensions.height180,
                child: Text(
                  widget.productDetail.title!.substring(
                      0,
                      widget.productDetail.title!.length < 30
                          ? widget.productDetail.title!.length
                          : 30),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueColorAsset),
                ),
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
                height: AppDimensions.height10,
              ),
              SizedBox(
                child: Row(
                  children: [
                    AppIconWidget(
                      icon: Icons.add,
                      size: AppDimensions.iconSize24,
                      onClick: () {
                        setState(() {
                          increaseQuantity(widget.productDetail.id!.toInt());
                        });
                        widget.totalItemAddToCart(
                            widget.productDetail.price!.toDouble());
                      },
                    ),
                    SizedBox(
                      width: AppDimensions.width10,
                    ),
                    Text('${widget.productDetail.quantity}'),
                    SizedBox(
                      width: AppDimensions.width10,
                    ),
                    AppIconWidget(
                      onClick: () {
                        setState(() {
                          decreaseQuantity(widget.productDetail.id!.toInt());
                          widget.totalItemRemoveToCart(
                              widget.productDetail.price!.toDouble(),
                              widget.productDetail.quantity!.toInt());
                        });
                      },
                      icon: Icons.remove,
                      backgroundColor: AppColors.greyShadow,
                      iconColor: AppColors.blueColorAsset,
                      size: AppDimensions.iconSize24,
                    ),
                    SizedBox(
                      width: AppDimensions.width10,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.removeItem!(true, widget.productDetail.quantity!,
                            widget.productDetail.price!.toDouble());
                      },
                      child: Container(
                        height: AppDimensions.height20,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.redTextColor),
                            color: AppColors.redTextColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Center(
                            child: Text(
                          'Remove',
                          style: TextStyle(color: AppColors.redTextColor),
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
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

  void decreaseQuantity(int id) async {
    final box = Boxes.getData();
    var data = box.values.toList().cast<ProductsModels>();

    if (data.isNotEmpty) {
      for (var item in data) {
        if (item.id == id) {
          if (item.quantity! > 1) {
            item.quantity = item.quantity! - 1;
          }
        }
      }
    }
  }
}
