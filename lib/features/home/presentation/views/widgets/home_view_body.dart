import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentation/views/widgets/futureBuilder_of_get_all_categories.dart';
import 'package:store_app/features/home/presentation/views/widgets/futureBuilder_of_get_all_products.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedIndex = -1;
  String? selectedCategory;

  void onCategoryTap(int index, String category) {
    setState(() {
      selectedIndex = index;
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
            child: FuturebuilderOfGetAllCategories(
              selectedIndex: selectedIndex,
              onCategoryTap: onCategoryTap,
            ),
          ),
          SizedBox(height: 55.h),
          Expanded(
            child: FutureBuilderOfGetAllProducts(
              category: selectedCategory,
            ),
          ),
        ],
      ),
    );
  }
}
