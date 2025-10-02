import 'package:flutter/foundation.dart';

class Cart {
  final String? productId;
  final String? productName;
  final String? productPrice;
  final String? productImage;

  Cart({
    this.productId,
    this.productName,
    this.productPrice,
    this.productImage,
  });
  factory Cart.fromMap(Map<String, dynamic> res) {
    return Cart(
      productId: res['productId'],
      productName: res['productName'],
      productPrice: res['productPrice'],
      productImage: res['productImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'productImage': productImage,
    };
  }
}