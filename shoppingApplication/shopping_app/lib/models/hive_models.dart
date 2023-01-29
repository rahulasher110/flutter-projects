import 'package:hive_flutter/hive_flutter.dart';
part 'hive_models.g.dart';

@HiveType(typeId: 0)
class ProductsModels extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  double? price;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? image;

  @HiveField(6)
  Rating? rating;

  @HiveField(7)
  int? quantity;

  ProductsModels(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.quantity});

  ProductsModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    quantity = json['quantity'];
  }
}

@HiveType(typeId: 1)
class Rating {
  @HiveField(0)
  double? rate;

  @HiveField(1)
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'].toDouble();
    count = json['count'];
  }
}
