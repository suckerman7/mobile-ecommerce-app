import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/products.dart';

class ProductService {
  Future<List<Product>> loadProducts() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/products.json',
    );

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList
      .map((json) => Product.fromJson(json))
      .toList();
  }
}