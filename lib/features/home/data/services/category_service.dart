import 'package:store_app/features/home/data/helper/api.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class CategoryService {
  Future<List<ProductModel>> getCategorysProducts({
    required String category,
  }) async {
    List<dynamic> data = await Api().get(endPoint: 'products/category/$category');
    List<ProductModel> productsList = [];
    for (var item in data) {
      productsList.add(ProductModel.fromJson(item));
    }
    return productsList;
  }
}
