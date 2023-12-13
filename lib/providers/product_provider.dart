import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_products/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final List<dynamic> data = jsonData['products'];
      _products = data.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      print("Error while calling data: $error");
    }
  }
}
