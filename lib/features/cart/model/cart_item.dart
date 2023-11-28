import 'package:e_store/features/home/model/product_model.dart';

class CartItem {
  final ProductModel productModel;
  int quantity;

  CartItem({
    required this.productModel,
    required this.quantity,
  });
}