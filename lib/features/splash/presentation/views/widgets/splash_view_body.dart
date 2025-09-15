import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      executeNavigation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/store_logo.png",
            fit: BoxFit.cover,
            width: 320.w,
          ),
        ),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 4), () {
      if(!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}
