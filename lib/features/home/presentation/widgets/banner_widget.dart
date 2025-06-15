import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/style.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          colors: [kOrangePeach, kPeach],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ListTile(
          leading: Image.asset(
            'assets/images/banner_item.png',
            height: 45.h,
            width: 45.w,
          ),
          title: Text(
            'Free Premium Available',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              color: kDarkGrey,
            ),
          ),
          subtitle: Text(
            'Tap to claim',
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'Poppins',
              color: kDarkGrey,
            ),
          ),
        ),
      ),
    );
  }
}
