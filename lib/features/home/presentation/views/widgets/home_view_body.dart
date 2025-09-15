import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentation/views/widgets/futureBuilder_of_get_all_categories.dart';
import 'package:store_app/features/home/presentation/views/widgets/futureBuilder_of_get_all_products.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        children: [
          SizedBox(height: 100.h, child: futureBuilderOfGetAllCategories()),
          SizedBox(height: 55.h),
          Expanded(child: futureBuilderOfGetAllProducts()),
        ],
      ),
    );
  }
}
