import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/constants/app_colors.dart';
import 'package:store_app/core/constants/app_styles.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;
  String formatPrice(double price) {
    if (price % 1 == 0) {
      return price.toInt().toString();
    } else {
      return price.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 20,
                blurRadius: 50,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          child: Card(
            color: AppColors.whiteColor,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    product.title.length > 10
                        ? "${product.title.substring(0, 10)}..."
                        : product.title,
                    style: AppStyles.headline1,
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${formatPrice(product.price)}",
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.headline1.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(left: 20.w),
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -60.h,
          right: 32.w,
          left: 32.w,
          child: CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            fit: BoxFit.contain,
            imageUrl: product.image,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
