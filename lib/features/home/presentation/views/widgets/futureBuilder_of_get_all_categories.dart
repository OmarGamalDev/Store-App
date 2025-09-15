import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/services/all_categories_services.dart';
import 'package:store_app/features/home/presentation/views/widgets/display_categories.dart';

class FuturebuilderOfGetAllCategories extends StatelessWidget {
  final int selectedIndex;
  final Function(int, String) onCategoryTap;

  const FuturebuilderOfGetAllCategories({
    super.key,
    required this.selectedIndex,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: AllCategoriesServices().getAllCategories(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasData) {
          List<dynamic> categories = asyncSnapshot.data!;
          return displayCategories(
            categories,
            selectedIndex,
            (index) => onCategoryTap(index, categories[index]),
          );
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text('Error: ${asyncSnapshot.error}'));
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
