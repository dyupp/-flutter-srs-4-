import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class CatalogPage extends StatelessWidget {
  final Set<String> favoriteItems;
  final Function(String) onToggleFavorite;

  const CatalogPage({
    super.key,
    required this.favoriteItems,
    required this.onToggleFavorite,
  });

  final List<Map<String, dynamic>> products = const [
    {'name': 'Ноутбук Gaming', 'price': '450 000', 'icon': Icons.laptop_chromebook},
    {'name': 'Смартфон Pro', 'price': '320 000', 'icon': Icons.phone_android},
    {'name': 'Механическая клавиатура', 'price': '28 000', 'icon': Icons.keyboard},
    {'name': 'Беспроводные наушники', 'price': '35 000', 'icon': Icons.headphones},
    {'name': 'Игровая мышь', 'price': '15 000', 'icon': Icons.mouse},
    {'name': 'Монитор 165Hz', 'price': '110 000', 'icon': Icons.monitor},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('catalog'.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12.w),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (context, index) {
          final item = products[index];
          final isFav = favoriteItems.contains(item['name']);

          return Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Icon(item['icon'] as IconData, size: 54.sp, color: AppColors.primary),
                  ),
                ),
                Text(
                  item['name'] as String,
                  style: AppTextStyles.subtitle.copyWith(fontSize: 14.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'price'.tr(args: [item['price'] as String]),
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : AppColors.textSecondary,
                    ),
                    onPressed: () {
                      onToggleFavorite(item['name'] as String);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isFav ? 'removed_from_fav'.tr() : 'added_to_fav'.tr()),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}