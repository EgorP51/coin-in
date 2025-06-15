import 'package:coin_in/core/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 29.h),
            child: Container(
              height: 95.h,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kBlack.withValues(alpha: 0.08),
                    blurRadius: 40.h,
                    offset: const Offset(0, -0.1),
                  ),
                ],
                color: Theme.of(context).brightness == Brightness.light
                    ? kWhite
                    : kDarkBlueGrey,
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: CustomNavBarItem(
                        iconPath: 'assets/icons/home_icon.svg',
                        label: 'Home',
                        isSelected: _selectedIndex == 0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: CustomNavBarItem(
                        iconPath: 'assets/icons/search_icon.svg',
                        label: 'Search',
                        isSelected: _selectedIndex == 1,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: CustomNavBarItem(
                        iconPath: 'assets/icons/clock_icon.svg',
                        label: 'History',
                        isSelected: _selectedIndex == 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      child: CustomNavBarItem(
                        iconPath: 'assets/icons/collection_icon.svg',
                        label: 'Collection',
                        isSelected: _selectedIndex == 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              child: SvgPicture.asset(
                'assets/icons/big_camera_icon.svg',
                width: 70.w,
                height: 70.h,
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    this.iconPath,
    this.label,
    required this.isSelected,
  });

  final String? iconPath;
  final String? label;
  final bool isSelected;

  _color(BuildContext context, bool isSelected) {
    return Theme.of(context).brightness == Brightness.light
        ? (isSelected ? kAmber : kSteelBlue)
        : (isSelected ? kAmber : kGrey);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath ?? '',
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            _color(context, isSelected),
            BlendMode.srcIn,
          ),
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
        ),
        SizedBox(height: 4.h),
        Text(
          label ?? '',
          style: TextStyle(
            fontSize: 12.sp,
            color: _color(context, isSelected),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
