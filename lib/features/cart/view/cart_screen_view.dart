import 'package:e_store/features/cart/view/widget/cart_item_card.dart';
import 'package:e_store/features/cart/view_model/cart_view_model.dart';
import 'package:e_store/features/checkout/view/checkou_screen_view.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:e_store/res/widgets/appbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        leading:  AppbarIcons(
          function: () {
            Navigator.pop(context);
          },
          icons: IconlyBold.arrowLeftCircle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartViewModel>(
              builder: (context, cart, child) {
                return ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    return CartItemCard(index: index);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          Consumer<CartViewModel>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total: \$${cart.getTotal().toStringAsFixed(2)}'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: CheckoutScreen(cartDetails: cart),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightIconsColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
