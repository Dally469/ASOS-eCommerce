import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String prodID;
  final String title;
  final String img;
  final double quantity;
  final double price;
  final double availQuantity;

  CartItem({
    required this.id,
    required this.prodID,
    required this.title,
    required this.quantity,
    required this.price,
    required this.img,
    required this.availQuantity,
  });

}

class Carts with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }
  void addItem(String productId, double price, String title, String img,
      double availQuantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          img: existingCartItem.img,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          availQuantity: existingCartItem.availQuantity, prodID: '',
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: productId,
          title: title,
          img: img,
          price: price,
          quantity: 1,
          availQuantity: availQuantity, prodID: '',
        ),
      );
    }

    notifyListeners();
  }

}