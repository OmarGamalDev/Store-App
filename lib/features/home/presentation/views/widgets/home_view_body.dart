import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/constants/app_colors.dart';
import 'package:store_app/core/constants/app_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.35.w / 0.5.h,
          crossAxisSpacing: 5.w,
          mainAxisSpacing: 10.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: const Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              color: AppColors.whiteColor,
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    height: 150.h,
                    width: double.infinity,
                    imageUrl:
                        'https://imgs.search.brave.com/m6Ur2bnAjnXjWM4kJ6ESgqVhdnBa8OrwP0FvPSXmjhM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y2hhcmxlc2tlaXRo/LmNvbS9kdy9pbWFn/ZS92Mi9CQ1dKX1BS/RC9vbi9kZW1hbmR3/YXJlLnN0YXRpYy8t/L1NpdGVzLWNrLXBy/b2R1Y3RzL2RlZmF1/bHQvZHdhZjdiZTA1/NC9pbWFnZXMvaGkt/cmVzLzIwMjUtTDYt/Q0syLTgwMTUxNTY0/LVMxLTcuanBnP3N3/PTc1NiZzaD0xMDA4',
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: Colors.orange,
                      strokeWidth: 2.w,
                      backgroundColor: Colors.white,
                      strokeCap: StrokeCap.round,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Hand Bag Lv', style: AppStyles.headline1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          r'$120',
                          style: AppStyles.headline1.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
