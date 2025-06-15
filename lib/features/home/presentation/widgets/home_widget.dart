import 'package:coin_in/core/ui/style.dart';
import 'package:coin_in/core/ui/widgets/custom_nav_bar.dart';
import 'package:coin_in/features/home/presentation/widgets/banner_widget.dart';
import 'package:coin_in/features/home/presentation/widgets/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/ui/widgets/app_scaffold.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'CoinIn',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(right: 16.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: kAmber.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SvgPicture.asset(
              'assets/icons/settings_icon.svg',
              height: 12.h,
              width: 12.w,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            BannerWidget(),
            Expanded(
              child: Align(alignment: Alignment(0, -0.5), child: CoinWidget()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
