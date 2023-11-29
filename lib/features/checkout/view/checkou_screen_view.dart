import 'package:e_store/features/cart/view_model/cart_view_model.dart';
import 'package:e_store/features/checkout/view/widget/price_details_widget.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:e_store/res/widgets/appbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.cartDetails,
  });

  final CartViewModel cartDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: AppbarIcons(
          function: () {
            Navigator.pop(context);
          },
          icons: IconlyBold.arrowLeftCircle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            PriceDetails(
              itemsCount: cartDetails.items.length,
              subtotal: cartDetails.getTotal(),
              shipping: 49,
              tax: 0.00,
              total: cartDetails.getTotal() + 49,
            ),
            const Spacer(),
            const Divider(height: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${(cartDetails.getTotal() + 49).toStringAsFixed(2)}'),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.fade,
                      //     child: CheckoutScreen(cartDetails: cart),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightIconsColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
