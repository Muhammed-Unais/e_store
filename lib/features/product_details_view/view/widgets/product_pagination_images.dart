import 'package:card_swiper/card_swiper.dart';
import 'package:e_store/features/home/model/product_model.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class PaginationProductImages extends StatelessWidget {
  const PaginationProductImages({
    super.key,
    required this.size, required this.productModel,
  });

  final Size size;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.32,
      child: Swiper(
        autoplay: false,
        itemCount: productModel.images.length,
        itemBuilder: (context, index) {
          return FancyShimmerImage(
            imageUrl:
                productModel.images[index],
            width: double.infinity,
            boxFit: BoxFit.contain,
          );
        },
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
