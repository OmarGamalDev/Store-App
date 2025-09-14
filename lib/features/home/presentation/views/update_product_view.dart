import 'package:flutter/material.dart';
import 'package:store_app/core/constants/app_colors.dart';
import 'package:store_app/core/constants/app_styles.dart';
import 'package:store_app/features/home/presentation/views/widgets/update_product_view_body.dart';

class UpdateProductView extends StatelessWidget {
  const UpdateProductView({super.key});
  static const String routeName = '/updateProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Update Product', style: AppStyles.appBarText),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 20,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
        ),
      ),
      body: UpdateProductViewBody(),
    );
  }
}
