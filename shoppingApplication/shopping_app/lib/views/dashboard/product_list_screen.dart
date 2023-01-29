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
  // final _myBox = Hive.box('cartBox');
  final scrollController = ScrollController();
  bool isLoading = false;
  bool isLoadingVertical = false;
  final int increment = 10;
  final List<String> _filters = <String>[];
  final List<Products> _displayFilters = <Products>[];
  final TextEditingController _searchController = TextEditingController();

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

  void removeData() {}

  void addToFilters(String category) {
    for (var item in listOfProducts) {
      if (category == item.category) {
        _displayFilters.add(item);
      }
    }
  }

  void removeFilters(String category) {
    _displayFilters.removeWhere((element) => element.category == category);
  }

  Widget appBarTitle = const Text("Product");
  Icon actionIcon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: [
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = const Icon(Icons.close);
                  appBarTitle = TextField(
                    controller: _searchController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                            onTap: () {
                              if (_searchController.text.isNotEmpty) {
                                if (listOfCategory
                                    .contains(_searchController.text)) {
                                  setState(() {
                                    _filters.add(_searchController.text);
                                    addToFilters(_searchController.text);
                                  });
                                } else {
                                  Get.snackbar(
                                    'Type correct category',
                                    "",
                                    snackPosition: SnackPosition.TOP,
                                  );
                                }
                              } else {
                                Get.snackbar(
                                  'Please enter something',
                                  "",
                                  snackPosition: SnackPosition.TOP,
                                );
                              }
                            },
                            child:
                                const Icon(Icons.search, color: Colors.white)),
                        hintText: "Search...",
                        hintStyle: const TextStyle(color: Colors.white)),
                  );
                } else {
                  _filters.clear();
                  _displayFilters.clear();
                  actionIcon = const Icon(Icons.search);
                  appBarTitle = const Text("Products");
                }
              });
            },
          ),
          GestureDetector(
            onTap: () {
              // readData();
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
                Text(
                  'Our Products',
                  style: TextStyle(
                      fontSize: AppDimensions.font32,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: AppDimensions.height20,
                ),
                Wrap(
                  spacing: AppDimensions.width10,
                  children: listOfCategory.map((e) {
                    return FilterChip(
                      label: Text(
                        e,
                      ),
                      elevation: 1,
                      selectedColor: Colors.blue,
                      selected: _filters.contains(e),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      onSelected: (bool value) {
                        setState(() {
                          if (value) {
                            if (!_filters.contains(e)) {
                              _filters.add(e);
                              addToFilters(e);
                            }
                          } else {
                            _filters.removeWhere((element) => element == e);
                            removeFilters(e);
                          }
                        });
                      },
                    );
                  }).toList(),
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
                          itemCount: _filters.isEmpty
                              ? listOfProducts.length
                              : _displayFilters.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _filters.isEmpty
                                ? GestureDetector(
                                    onTap: () => Get.to(ProductDescription(
                                      itemDescription: listOfProducts[index],
                                    )),
                                    child: ProductWidget(
                                      title: listOfProducts[index].title,
                                      price: listOfProducts[index].price,
                                      image: listOfProducts[index].image,
                                      rating: listOfProducts[index].rating.rate,
                                      category: listOfProducts[index].category,
                                      isLiked: (v) {
                                        setState(() {
                                          if (v) {
                                            listOfItemsAddToCart
                                                .add(listOfProducts[index]);
                                            // writeData();
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
                                  )
                                : GestureDetector(
                                    onTap: () => Get.to(ProductDescription(
                                      itemDescription: _displayFilters[index],
                                    )),
                                    child: ProductWidget(
                                      title: _displayFilters[index]
                                          .title
                                          .toString(),
                                      price: _displayFilters[index]
                                          .price!
                                          .toDouble(),
                                      image: _displayFilters[index]
                                          .image
                                          .toString(),
                                      rating: _displayFilters[index]
                                          .rating!
                                          .rate!
                                          .toDouble(),
                                      category: _displayFilters[index]
                                          .category
                                          .toString(),
                                      isLiked: (v) {
                                        setState(() {
                                          if (v) {
                                            listOfItemsAddToCart
                                                .add(listOfProducts[index]);
                                            // writeData();
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
