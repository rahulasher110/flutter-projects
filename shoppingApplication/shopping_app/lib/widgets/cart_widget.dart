import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/models/products.dart';

class CartWidget extends StatelessWidget {
  Products productDetail;
  CartWidget({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network(productDetail.image.toString()),
          Text(productDetail.title.toString())
        ],
      ),
    );
  }
}
