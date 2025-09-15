import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/constants/app_styles.dart';
import 'package:store_app/core/shared_widgets/custom_button.dart';
import 'package:store_app/core/shared_widgets/custom_text_form_field.dart';

class UpdateProductViewBody extends StatelessWidget {
  UpdateProductViewBody({super.key});
  String? productName, description, image;
  int? price;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Product Name',
              keyboardType: TextInputType.text,
              onChanged: (data) {
                productName = data;
              },
            ),
            CustomTextField(
              hintText: 'description',
              keyboardType: TextInputType.text,
              onChanged: (data) {
                description = data;
              },
            ),
            CustomTextField(
              hintText: 'price',
              keyboardType: TextInputType.number,
              onChanged: (data) {
                price = int.tryParse(data);
              },
            ),
            CustomTextField(
              hintText: 'image',
              keyboardType: TextInputType.text,
              onChanged: (data) {
                image = data;
              },
            ),
            SizedBox(height: 30.h),
            CustomButton(
              onPressed: () {},
              text: 'Update Product',
              backgroundColor: Colors.black,
              height: 50.h,
              width: double.infinity,
              style: AppStyles.buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
