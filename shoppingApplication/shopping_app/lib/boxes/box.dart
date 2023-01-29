import 'package:hive/hive.dart';
import 'package:shopping_app/models/hive_models.dart';

class Boxes {
  static Box<ProductsModels> getData() => Hive.box<ProductsModels>('cartBox');
}
