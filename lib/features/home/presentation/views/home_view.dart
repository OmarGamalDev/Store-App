import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/core/constants/app_colors.dart';
import 'package:store_app/core/constants/app_styles.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        backgroundColor: AppColors.lightBlue,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('New Trends', style: AppStyles.appBarText),
        leading: SizedBox(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: FaIcon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
