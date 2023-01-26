import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/views/dashboard/item_description.dart';
import 'package:shopping_app/widgets/product_widget.dart';

class ListOfProducts extends StatefulWidget {
  const ListOfProducts({super.key});

  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  bool isLoading = false;
  List<dynamic> listOfProducts = [];
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
      print('object');
    } else {
      Get.snackbar(
        'Something went wrong. Please try after some time!',
        "",
        snackPosition: SnackPosition.TOP,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(),
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
                SizedBox(
                  height: AppDimensions.height45,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfCategory.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius:
                                BorderRadius.circular(AppDimensions.radius12)),
                        child: Center(
                            child: Padding(
                          padding: AppDimensions.pagePadding,
                          child: Text(
                            listOfCategory[index],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height30,
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : LazyLoadScrollView(
                        onEndOfPage: () {},
                        child: GridView.builder(
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
