import 'package:e_store/features/cart/model/cart_item.dart';
import 'package:e_store/utils/utils.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item, BuildContext context) {
    if (!isInCart(item.productModel.id)) {
      _items.add(item);
      notifyListeners();

      Utils().showSnackBar(
        context,
        content: item.productModel.title,
        actionLabel: "undo",
        onPressed: () {
          _items.removeLast();
          notifyListeners();
        },
      );
    } else {
      Utils().showSnackBar(
        context,
        content: "Already",
        onPressed: () {},
      );
    }
  }

  bool isInCart(int id) {
    for (var element in _items) {
      if (element.productModel.id == id) {
        return true;
      }
    }
    return false;
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  double getTotal() {
    return _items.fold(
        0, (sum, item) => sum + item.productModel.price * item.quantity);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
