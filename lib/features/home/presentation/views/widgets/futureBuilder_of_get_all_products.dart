import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/data/services/get_all_products.dart';
import 'package:store_app/features/home/presentation/views/widgets/display_products_in_grid_view_builder.dart';

FutureBuilder<List<ProductModel>> futureBuilderOfGetAllProducts() {
    return FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return gridViewBuilder(products);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return const Center(child: Text('Something went wrong!'));
              }
            },
          );
  }