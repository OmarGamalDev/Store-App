import 'package:store_app/features/home/data/helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(endPoint: '/products/categories');
      return data;    
  }
}
