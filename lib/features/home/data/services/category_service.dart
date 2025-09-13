import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/features/home/data/models/product_model.dart';

class CategoryService {
  Future<List<ProductModel>> getCategorysProducts({
    required String category,
  }) async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/$category'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> productsList = [];
      for (var item in data) {
        productsList.add(ProductModel.fromJson(item));
      }
      return productsList;
    } else {
      throw Exception('Failed to load category products{$response.statusCode}');
    }
  }
}
