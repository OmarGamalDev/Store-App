  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_card.dart';

GridView gridViewBuilder(List<ProductModel> products) {
    return GridView.builder(
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.19,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 70.h,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
  }