import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items == null || !_items.containsKey(productId)) {
      _items[productId] = CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1);
    } else {
      _items[productId].quantity++;
    }
    notifyListeners();
  }

  void removeItem(String id){
    _items.remove(id);
    notifyListeners();
  }


  void removeSingleItem(String productId){
    if(_items[productId].quantity > 1){
      _items[productId].quantity --;
    }
    else{
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }
}
