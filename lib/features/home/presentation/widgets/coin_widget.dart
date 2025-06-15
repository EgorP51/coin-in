import 'package:coin_in/core/ui/style.dart';
import 'package:coin_in/features/home/manager/image_picker_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CoinWidget extends StatelessWidget {
  const CoinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerProvider>(
      builder: (context, value, child) {
        var image = value.selectedImage;

        return SizedBox(
          height: 244.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 169.h,
                margin: EdgeInsets.only(top: 75.h),
                decoration: BoxDecoration(
                  color: kBeige,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: SizedBox(
                      height: 44.h,
                      width: 189.w,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          context.read<ImagePickerProvider>().pickImageAndCrop(
                            context,
                          );
                        },
                        color: kWhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/camera_icon.svg',
                              height: 24.h,
                              width: 24.w,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Identify Coin',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: kAmber,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150.r),
                  boxShadow: [
                    BoxShadow(
                      color: kBlack.withValues(alpha: 0.3),
                      blurRadius: 10.r,
                      spreadRadius: 0,
                      offset: Offset(0, 6.h),
                    ),
                  ],
                ),
                child: image == null
                    ? Image.asset(
                        'assets/images/default_coin.png',
                        height: 150.h,
                        width: 150.w,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(150.r),
                        child: Image.file(
                          image,
                          height: 150.h,
                          width: 150.w,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
