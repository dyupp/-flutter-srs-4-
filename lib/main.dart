import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/bottom_bar.dart';
import 'pages/home_page.dart';
import 'pages/catalog_page.dart';
import 'pages/favorites_page.dart';
import 'pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
        Locale('kk'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const MainWrapperScreen(),
        );
      },
    );
  }
}

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  int _currentIndex = 0;
  final Set<String> _favoriteItems = {'Ноутбук Gaming', 'Беспроводные наушники'};

  void _toggleFavorite(String item) {
    setState(() {
      if (_favoriteItems.contains(item)) {
        _favoriteItems.remove(item);
      } else {
        _favoriteItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      CatalogPage(
        favoriteItems: _favoriteItems,
        onToggleFavorite: _toggleFavorite,
      ),
      FavoritesPage(
        favoriteItems: _favoriteItems,
        onRemoveFavorite: (item) => _toggleFavorite(item),
      ),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: AppBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}