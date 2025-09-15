import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/data/services/get_all_products.dart';
import 'package:store_app/features/home/data/services/category_service.dart';
import 'package:store_app/features/home/presentation/views/widgets/display_products_in_grid_view_builder.dart';

class FutureBuilderOfGetAllProducts extends StatelessWidget {
  final String? category;
  const FutureBuilderOfGetAllProducts({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: category == null
          ? AllProductsService().getAllProducts()
          : CategoryService().getCategorysProducts(category: category!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return gridViewBuilder(snapshot.data!);
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
