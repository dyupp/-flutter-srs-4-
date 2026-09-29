import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('home'.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('welcome_title'.tr(), style: AppTextStyles.title),
            SizedBox(height: 6.h),
            Text('welcome_sub'.tr(), style: AppTextStyles.body),
            SizedBox(height: 20.h),
            Text('special_offers'.tr(), style: AppTextStyles.subtitle),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.local_offer, size: 36.sp, color: AppColors.accent),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Text('offer_1'.tr(), style: AppTextStyles.subtitle),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.delivery_dining, size: 36.sp, color: AppColors.primary),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Text('offer_2'.tr(), style: AppTextStyles.subtitle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}