import 'package:e_store/features/cart/view/cart_screen_view.dart';
import 'package:e_store/features/home/view/home_view.dart';
import 'package:e_store/features/home/view_model/home_view_model.dart';
import 'package:e_store/features/product_details_view/view_model/single_product_details_view_model.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SingleProductDetailsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.lightScaffoldColor,
        primaryColor: AppColors.lightCardColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.lightIconsColor,
          ),
          backgroundColor: AppColors.lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.lightTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.lightIconsColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,
        ),
        cardColor: AppColors.lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: AppColors.lightIconsColor,
              brightness: Brightness.light,
            ),
      ),
      home: const HomeScreenView(),
    );
  }
}
