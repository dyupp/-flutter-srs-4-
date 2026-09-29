import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('profile'.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 46.r,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 50.sp, color: AppColors.white),
            ),
            SizedBox(height: 12.h),
            Text('user_name'.tr(), style: AppTextStyles.title),
            Text('student@flutter.edu', style: AppTextStyles.body),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('language'.tr(), style: AppTextStyles.subtitle),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.setLocale(const Locale('ru')),
                        child: const Text('RU'),
                      ),
                      ElevatedButton(
                        onPressed: () => context.setLocale(const Locale('en')),
                        child: const Text('EN'),
                      ),
                      ElevatedButton(
                        onPressed: () => context.setLocale(const Locale('kk')),
                        child: const Text('KK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'app_info'.tr(),
                style: AppTextStyles.caption,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}