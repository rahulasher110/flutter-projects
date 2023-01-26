import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/utils/assets.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_icon.dart';
import 'package:shopping_app/widgets/cart_widget.dart';

class CartList extends StatefulWidget {
  final List<Products> listOfItemsAddedToCart;
  const CartList({super.key, required this.listOfItemsAddedToCart});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
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
                backgroundColor: Colors.greenAccent[400],
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Get.back(),
                ),
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
                      setState(() {
                        widget.listOfItemsAddedToCart.clear();
                      });
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                  child: widget.listOfItemsAddedToCart.isEmpty
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
                      : ListView.builder(
                          padding: EdgeInsets.only(top: AppDimensions.height20),
                          shrinkWrap: true,
                          itemCount: widget.listOfItemsAddedToCart.length,
                          itemBuilder: (context, index) {
                            return CartWidget(
                                productDetail:
                                    widget.listOfItemsAddedToCart[index]);
                          },
                        )) //
            ],
          ),
          widget.listOfItemsAddedToCart.isEmpty
              ? Container()
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
                          '₹ ',
                          style: TextStyle(
                              fontSize: AppDimensions.font28,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 36, 96, 141)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 223, 223, 223),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.radius20)),
                          padding: const EdgeInsets.all(
                              AppDimensions.horizontalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppIconWidget(
                                  icon: Icons.next_week_outlined),
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
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
