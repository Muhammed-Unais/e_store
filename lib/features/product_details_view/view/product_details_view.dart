import 'package:e_store/data/app_response/status_enum.dart';
import 'package:e_store/features/cart/view/cart_screen_view.dart';
import 'package:e_store/features/product_details_view/view/widgets/add_to_cart_floationg_button.dart';
import 'package:e_store/features/product_details_view/view/widgets/product_all_details_widget.dart';
import 'package:e_store/features/product_details_view/view_model/single_product_details_view_model.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:e_store/res/widgets/appbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreenView extends StatefulWidget {
  const ProductDetailsScreenView({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreenView> createState() =>
      _ProductDetailsScreenViewState();
}

class _ProductDetailsScreenViewState extends State<ProductDetailsScreenView> {
  @override
  void initState() {
    getSingleProductDetails();
    super.initState();
  }

  void getSingleProductDetails() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<SingleProductDetailsViewModel>()
          .getSingleProduct(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const MyFloatingActionButton(),
      appBar: AppBar(
        leading: AppbarIcons(
          function: () {
            Navigator.pop(context);
          },
          icons: IconlyBold.arrowLeftCircle,
        ),
        actions: [
          AppbarIcons(
            function: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const CartScreen(),
                ),
              );
            },
            icons: Icons.shopping_cart,
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<SingleProductDetailsViewModel>(
          builder: (context, singleProductDetailsProvider, _) {
            Status? status = singleProductDetailsProvider
                .singleProductDetailsResponse.status;
            final response =
                singleProductDetailsProvider.singleProductDetailsResponse;
            switch (status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.lightIconsColor,
                  ),
                );
              case Status.completed:
                return ProductAllDetailsWidget(
                  response: response,
                  size: size,
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
      ),
    );
  }
}
