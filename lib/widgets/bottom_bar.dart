import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../core/constants/app_colors.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'home'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_bag),
          label: 'catalog'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: 'favorites'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'profile'.tr(),
        ),
      ],
    );
  }
}