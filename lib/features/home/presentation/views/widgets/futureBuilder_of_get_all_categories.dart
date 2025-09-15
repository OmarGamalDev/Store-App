  import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/services/all_categories_services.dart';
import 'package:store_app/features/home/presentation/views/widgets/display_categories.dart';

FutureBuilder<List<dynamic>> futureBuilderOfGetAllCategories() {
    return FutureBuilder(
      future: AllCategoriesServices().getAllCategories(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasData) {
          List<dynamic> categories = asyncSnapshot.data!;
          return displayCategories(categories, 0, (index) {});
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text('Error: ${asyncSnapshot.error}'));
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
