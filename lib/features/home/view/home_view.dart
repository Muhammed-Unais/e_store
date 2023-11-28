import 'package:card_swiper/card_swiper.dart';
import 'package:e_store/features/home/view/widget/home_appbar.dart';
import 'package:e_store/features/home/view/widget/home_banner.dart';
import 'package:e_store/features/home/view/widget/home_product_listing.dart';
import 'package:e_store/features/home/view/widget/home_search_field.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:e_store/res/widgets/titiles_view_more_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(
            56,
          ),
          child: HomeAppbar(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              SearchTextfield(
                textEditingController: textEditingController,
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.21,
                        child: Swiper(
                          autoplay: true,
                          itemCount: 3,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return const HomeBanner();
                          },
                          pagination: const SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: AppColors.lightIconsColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TitilsAndViewmore(
                        allProducuNavAct: () {
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //     type: PageTransitionType.fade,
                          //     child: const FeedScreen(),
                          //   ),
                          // );
                        },
                      ),
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


