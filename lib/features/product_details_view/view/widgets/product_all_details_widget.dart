import 'package:e_store/data/app_response/api_response.dart';
import 'package:e_store/features/home/model/product_model.dart';
import 'package:e_store/features/product_details_view/view/widgets/product_discription.dart';
import 'package:e_store/features/product_details_view/view/widgets/product_name_and_price.dart';
import 'package:e_store/features/product_details_view/view/widgets/product_pagination_images.dart';
import 'package:flutter/material.dart';

class ProductAllDetailsWidget extends StatelessWidget {
  const ProductAllDetailsWidget({
    super.key,
    required this.response,
    required this.size,
  });

  final ApiResponse<ProductModel> response;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  response.data!.category.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                ProductNameAndPrice(
                  title: response.data!.title,
                  price: response.data!.price.toString(),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
          SwiperProductImages(
            size: size,
            productModel: response.data!,
          ),
          const SizedBox(height: 18),
          ProductDescrption(
            productModel: response.data!,
          ),
        ],
      ),
    );
  }
}