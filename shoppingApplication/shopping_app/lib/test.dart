import 'package:flutter/material.dart';
import 'package:shopping_app/boxes/box.dart';
import 'package:shopping_app/models/hive_models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestDart extends StatefulWidget {
  const TestDart({super.key});

  @override
  State<TestDart> createState() => _TestDartState();
}

class _TestDartState extends State<TestDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<ProductsModels>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<ProductsModels>();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Text(data[index].title.toString()),
                    Image.network(data[index].image.toString())
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
