import 'package:e_store/features/home/view/widget/home_appbar.dart';
import 'package:e_store/features/home/view/widget/home_banner_widget.dart';
import 'package:e_store/features/home/view/widget/home_product_listing.dart';
import 'package:e_store/features/home/view/widget/home_search_field.dart';
import 'package:e_store/res/widgets/titiles_view_more_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: HomeAppbar(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              const SearchTextfield(),
              const SizedBox(height: 18),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeBannerWidget(size: size),
                      const SizedBox(height: 10),
                      const TitilsAndViewmore(),
                      HomeProductsListing(size: size),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
