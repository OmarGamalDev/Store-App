import 'package:store_app/features/home/data/helper/api.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class UpdateProducts {
  Future<ProductModel> updateProductService({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    print(
      "id: $id, title: $title, price: $price, description: $description, image: $image, category: $category",
    );
    var data = await Api().put(
      endPoint: "products/$id",
      data: {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
