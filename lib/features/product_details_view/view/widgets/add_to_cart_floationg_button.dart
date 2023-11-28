import 'package:e_store/data/app_response/status_enum.dart';
import 'package:e_store/features/cart/model/cart_item.dart';
import 'package:e_store/features/cart/view_model/cart_view_model.dart';
import 'package:e_store/features/product_details_view/view_model/single_product_details_view_model.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Consumer<SingleProductDetailsViewModel>(
        builder: (context, singleProductDetailsProvider, _) {
          Status? status =
              singleProductDetailsProvider.singleProductDetailsResponse.status;
          final response =
              singleProductDetailsProvider.singleProductDetailsResponse;
          switch (status) {
            case Status.loading:
              return const SizedBox();
            case Status.completed:
              return FloatingActionButton(
                onPressed: () {
                  context.read<CartViewModel>().addItem(
                        CartItem(
                          productModel: response.data!,
                          quantity: 1,
                        ),
                        context,
                      );
                },
                elevation: 4.0,
                backgroundColor: AppColors.lightIconsColor,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              );
            case Status.error:
              return Center(
                child: Text(response.message.toString()),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
