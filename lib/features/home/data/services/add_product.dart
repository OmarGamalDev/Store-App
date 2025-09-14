import 'package:store_app/features/home/data/helper/api.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    var data = await Api().post(endPoint: "products", data: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });
    return ProductModel.fromJson(data);
  }
}