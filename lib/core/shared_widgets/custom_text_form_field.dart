import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    required this.keyboardType,
  });
  final String hintText;
  final Function(String) onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.amber),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
