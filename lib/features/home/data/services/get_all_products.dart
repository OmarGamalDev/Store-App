
import 'package:store_app/features/home/data/helper/api.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(endPoint: '/products');
    List<ProductModel> productsList = [];
    for (var element in data) {
      productsList.add(ProductModel.fromJson(element));
    }
      return productsList;
  }
}
