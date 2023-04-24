import 'package:state_managments_app/2-state/data/product_model/rating_model.dart';

class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;

  ProductModel(
      {this.id,
      this.category,
      this.description,
      this.image,
      this.price,
      this.rating,
      this.title});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      category: json["category"] ?? "",
      description: json["description"] ?? "",
      id: json["id"] ?? 0,
      price: json["price"] ?? 0,
      rating: RatingModel.fromJson(json["rating"] ?? {}),
    );
  }
}
