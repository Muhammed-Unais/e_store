import 'package:e_store/data/app_response/status_enum.dart';
import 'package:e_store/features/product_details_view/view/widgets/product_discription.dart';
import 'package:e_store/features/product_details_view/view/widgets/product_name_and_price.dart';
import 'package:e_store/features/product_details_view/view/widgets/product_pagination_images.dart';
import 'package:e_store/features/product_details_view/view_model/single_product_details_view_model.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:e_store/res/widgets/appbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
      appBar: AppBar(
        leading: AppbarIcons(
          function: () {
            Navigator.pop(context);
          },
          icons: IconlyBold.arrowLeftCircle,
        ),
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
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              // productModels!.category!.name!,
                              "Addidas Shows",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            ProductNameAndPrice(
                              title: response.data!.title,
                              price: response.data!.price.toString(),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                      PaginationProductImages(
                        size: size,
                        productModel: response.data!,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      ProductDescrption(
                        productModel: response.data!,
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
      ),
    );
  }
}
