import 'package:e_store/features/cart/view_model/cart_view_model.dart';
import 'package:e_store/res/constants/app_colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  final int index;
  const CartItemCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartViewModel>(context);
    return Card(
      color: AppColors.lightCardColor,
      surfaceTintColor: AppColors.lightCardColor,
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FancyShimmerImage(
            imageUrl: cart.items[index].productModel.images[0],
            width: 60,
            boxFit: BoxFit.cover,
            errorWidget: Image.asset(
              "assets/images/—Pngtree—casual shoes_5640199.png",
            ),
          ),
        ),
        title: Text(
          cart.items[index].productModel.title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text(
              'Price: \$${cart.items[index].productModel.price.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Text(
                  'Quantity: ${cart.items[index].quantity}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    cart.decreaseQuantity(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    cart.increaseQuantity(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cart.removeItem(index);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
