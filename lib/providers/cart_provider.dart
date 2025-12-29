import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  void addItem(Map<String, dynamic> product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> product) {
    cartItems.remove(product);
    notifyListeners();
  }
}
