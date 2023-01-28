import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/views/dashboard/cart_list.dart';
import 'package:shopping_app/views/dashboard/item_description.dart';
import 'package:shopping_app/widgets/app_icon.dart';
import 'package:shopping_app/widgets/product_widget.dart';
import 'package:shopping_app/widgets/shimmer_widget.dart';

class ListOfProducts extends StatefulWidget {
  const ListOfProducts({super.key});

  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  final _myBox = Hive.box('cartBox');
  final scrollController = ScrollController();
  bool isLoading = false;
  bool isLoadingVertical = false;
  final int increment = 10;
  String? selectCategory;

  List<dynamic> listOfProducts = [];
  List<Products> listOfItemsAddToCart = [];
  List<String> listOfCategory = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  @override
  void initState() {
    getListOfProducts();
    super.initState();
  }

  void getListOfProducts() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.https('fakestoreapi.com', '/products', {});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResp = jsonDecode(response.body);
      for (var item in jsonResp) {
        listOfProducts.add(Products.fromJson(item));
      }
    } else {
      Get.snackbar(
        'Something went wrong. Please try after some time! \nstatusCode: ${response.statusCode}',
        "",
        snackPosition: SnackPosition.TOP,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  void writeData() {
    _myBox.put('itemsAddToCart', listOfItemsAddToCart);
  }

  void removeData() {}

  void readData() {
    _myBox.get('itemsAddToCart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              readData();
              Get.to(CartList(
                listOfItemsAddedToCart: listOfItemsAddToCart,
              ));
            },
            child: Padding(
              padding: EdgeInsets.only(right: AppDimensions.height10),
              child: Row(
                children: [
                  AppIconWidget(
                    icon: Icons.shopping_cart_outlined,
                    size: AppDimensions.height45,
                  ),
                  Container(
                    height: AppDimensions.height30,
                    width: AppDimensions.height30,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 27, 99, 158),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radius30)),
                    child: Center(
                      child: Text(
                        listOfItemsAddToCart.length.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimensions.font16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Our Products',
                      style: TextStyle(
                          fontSize: AppDimensions.font32,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Text(
                            'Filters',
                            style: TextStyle(color: AppColors.greyTextColor),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          AppIconWidget(
                            icon: Icons.format_list_bulleted_sharp,
                            size: AppDimensions.iconsSize16,
                            iconColor: Colors.grey,
                            backgroundColor:
                                const Color.fromARGB(255, 242, 242, 242),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height20,
                ),
                SizedBox(
                  height: AppDimensions.height45,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: listOfCategory.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectCategory = listOfCategory[index];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.radius12)),
                          child: Center(
                              child: Padding(
                            padding: AppDimensions.pagePadding,
                            child: Text(
                              listOfCategory[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height30,
                ),
                isLoading
                    ? const ListOfProductShimmerWidget()
                    : LazyLoadScrollView(
                        onEndOfPage: () {},
                        child: GridView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / 1.8),
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                          ),
                          itemCount: listOfProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Get.to(ProductDescription(
                                itemDescription: listOfProducts[index],
                              )),
                              child: ProductWidget(
                                title: listOfProducts[index].title,
                                price: listOfProducts[index].price,
                                image: listOfProducts[index].image,
                                rating: listOfProducts[index].rating.rate,
                                category: listOfProducts[index].category,
                                selectedCategory: selectCategory ?? '',
                                isLiked: (v) {
                                  setState(() {
                                    if (v) {
                                      listOfItemsAddToCart
                                          .add(listOfProducts[index]);
                                      writeData();
                                    } else {
                                      listOfItemsAddToCart.removeWhere(
                                          (element) =>
                                              element.id ==
                                              listOfProducts[index].id);
                                      removeData();
                                      ;
                                    }
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
