import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/features/home/data/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> productsList = [];
      for (var element in data) {
        productsList.add(ProductModel.fromJson(element));
      }
      return productsList;
    } else {
      throw Exception('Failed to load category products{$response.statusCode}');
    }
  }
}
