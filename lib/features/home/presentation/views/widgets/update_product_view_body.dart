import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/constants/app_styles.dart';
import 'package:store_app/core/shared_widgets/custom_button.dart';
import 'package:store_app/core/shared_widgets/custom_text_form_field.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/data/services/update_products.dart';

class UpdateProductViewBody extends StatefulWidget {
  UpdateProductViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  State<UpdateProductViewBody> createState() => _UpdateProductViewBodyState();
}

class _UpdateProductViewBodyState extends State<UpdateProductViewBody> {
  String? productName, description, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SingleChildScrollView(
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
                  price = data;
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
                onPressed: ()async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct();
                    log('Product Updated');
                    Navigator.pop(context, true);
                  } catch (e) {
                    log('Error updating product: $e');
                  }
                  isLoading = false;
                  setState(() {});
                },
                text: 'Update Product',
                backgroundColor: Colors.black,
                height: 50.h,
                width: double.infinity,
                style: AppStyles.buttonText,
              ),
            ],
          ),
        ),
      ),
    );
  }

 Future <void> updateProduct() async {
    await UpdateProducts().updateProductService(
      id: widget.product.id,
      title: productName==null? widget.product.title:productName!,
      price: price == null ? widget.product.price : double.tryParse(price!) ?? widget.product.price,
      description: description == null ? widget.product.description:description!,
      image: image == null ? widget.product.image:image!,
      category: widget.product.category,
    );
  }
}
