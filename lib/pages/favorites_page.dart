import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class FavoritesPage extends StatelessWidget {
  final Set<String> favoriteItems;
  final Function(String) onRemoveFavorite;

  const FavoritesPage({
    super.key,
    required this.favoriteItems,
    required this.onRemoveFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final list = favoriteItems.toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('favorites'.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: list.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 60.sp, color: AppColors.textSecondary),
                  SizedBox(height: 12.h),
                  Text('favorites'.tr(), style: AppTextStyles.subtitle),
                ],
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(12.w),
              itemCount: list.length,
              separatorBuilder: (_, _) => SizedBox(height: 8.h),
              itemBuilder: (context, index) {
                final item = list[index];
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(item, style: AppTextStyles.subtitle),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => onRemoveFavorite(item),
                    ),
                  ),
                );
              },
            ),
    );
  }
}