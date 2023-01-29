import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/boxes/box.dart';
import 'package:shopping_app/models/hive_models.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/views/payment/payment_screen.dart';
import 'package:shopping_app/widgets/app_icon.dart';
import 'package:shopping_app/widgets/cart_widget.dart';

class CartList extends StatefulWidget {
  final Function(int val)? itemQuantity;
  final Function(bool val)? deleteAllItems;
  const CartList({super.key, this.itemQuantity, this.deleteAllItems});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  double totalPrice = 0;
  final box = Boxes.getData();
  @override
  void initState() {
    for (var item in box.values.toList()) {
      totalPrice += (item.price! * item.quantity!.toInt()).toDouble();
    }
    totalPrice.toPrecision(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyShadow,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: true,
                pinned: true,
                floating: true,
                expandedHeight: AppDimensions.height100,
                backgroundColor: Colors.blue,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Get.back()),
                title: Text(
                  'My Cart',
                  style: TextStyle(
                      fontSize: AppDimensions.font32,
                      fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      if (widget.deleteAllItems != null) {
                        Hive.box<ProductsModels>('cartBox').clear();
                        box.deleteAll(box.keys);
                        widget.deleteAllItems!(true);
                      }
                      if (widget.itemQuantity != null) {
                        widget.itemQuantity!(0);
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: box.isEmpty
                    ? Center(
                        child: Column(
                        children: [
                          LottieBuilder.asset(AppAssets.cartEmptyLottie),
                          const Text(
                            'Oops, your cart is empty!',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ))
                    : ValueListenableBuilder<Box<ProductsModels>>(
                        valueListenable: Boxes.getData().listenable(),
                        builder: (context, box, _) {
                          var data = box.values.toList().cast<ProductsModels>();
                          return ListView.builder(
                            padding:
                                EdgeInsets.only(top: AppDimensions.height20),
                            shrinkWrap: true,
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              return CartWidget(
                                productDetail: ProductsModels(
                                    id: data[index].id,
                                    title: data[index].title,
                                    price: data[index].price,
                                    description: data[index].description,
                                    category: data[index].category,
                                    image: data[index].image,
                                    quantity: data[index].quantity),
                                totalItemAddToCart: (v) {
                                  setState(() {
                                    totalPrice += v;
                                    if (widget.itemQuantity != null) {
                                      widget.itemQuantity!(
                                          data[index].quantity!.toInt());
                                    }
                                  });
                                },
                                totalItemRemoveToCart: (v, quant) {
                                  setState(() {
                                    if (quant > 1) {
                                      totalPrice -= v;
                                      if (widget.itemQuantity != null) {
                                        widget.itemQuantity!(
                                            data[index].quantity!.toInt());
                                      }
                                    }
                                  });
                                },
                                removeItem: (remove, count, val) {
                                  if (remove) {
                                    setState(() {
                                      var allData = box.values
                                          .toList()
                                          .cast<ProductsModels>();
                                      int getIdOfUnLikedItem =
                                          data[index].id!.toInt();
                                      int getIndexOfItemInBox = 0;
                                      int indexOfItem = 0;
                                      int getKeys = 0;
                                      for (var item in allData) {
                                        if (item.id == getIdOfUnLikedItem) {
                                          getIdOfUnLikedItem = item.id!;
                                          getIndexOfItemInBox = indexOfItem;
                                          getKeys = item.key;
                                        }
                                        indexOfItem++;
                                      }
                                      deleteData(data[getIndexOfItemInBox]);
                                      box.delete(getKeys);
                                      totalPrice -= count * val;
                                      if (widget.itemQuantity != null) {
                                        widget.itemQuantity!(0);
                                      }
                                      if (box.isEmpty) {
                                        if (widget.deleteAllItems != null) {
                                          widget.deleteAllItems!(true);
                                        }
                                      }
                                    });
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
              ) //
            ],
          ),
          box.isEmpty
              ? Positioned(
                  child: Container(),
                )
              : Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius20)),
                    padding:
                        const EdgeInsets.all(AppDimensions.horizontalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹ ${totalPrice.toPrecision(2).toString()}',
                          style: TextStyle(
                              fontSize: AppDimensions.font28,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 36, 96, 141)),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(PaymentScreen(
                            totalPrice: totalPrice,
                          )),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 223, 223, 223),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.radius20)),
                            padding: const EdgeInsets.all(
                                AppDimensions.horizontalPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppIconWidget(icon: Icons.next_week_outlined),
                                SizedBox(
                                  width: AppDimensions.width10,
                                ),
                                Text(
                                  'Checkout',
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

  void deleteData(ProductsModels products) async {
    await products.delete();
  }
}
