import 'package:card_swiper/card_swiper.dart';
import 'package:e_store/features/home/view/widget/home_banner.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.21,
      child: Swiper(
        autoplay: true,
        itemCount: 3,
        itemBuilder: (
          context,
          index,
        ) =>
            const HomeBanner(),
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.white,
            activeColor: AppColors.lightIconsColor,
          ),
        ),
      ),
    );
  }
}