import 'package:flutter/material.dart';

import 'models/products.dart';
import 'screens/home_screen.dart';
import '../models/cart_item.dart';

void main() {
  runApp(const MiniCatalogApp());
}

class MiniCatalogApp extends StatefulWidget {
  const MiniCatalogApp({super.key});

  @override
  State<MiniCatalogApp> createState() => _MiniCatalogAppState();
}

class _MiniCatalogAppState extends State<MiniCatalogApp> {
  final List<CartItem> cartItems = [];

  void addToCart(Product product) {
    setState(() {
      final existingItem = cartItems.where(
        (item) => item.product.id == product.id,
      );

      if (existingItem.isNotEmpty) {
        existingItem.first.quantity++;
      } else {
        cartItems.add(
          CartItem(product: product),
        );
      }
    });
  }

  void addQuantity(int productId) {
    setState(() {
      final item = cartItems.firstWhere(
        (item) => item.product.id == productId,
      );

      item.quantity++;
    });
  }

  void removeQuantity(int productId) {
    setState(() {
      final item = cartItems.firstWhere(
        (item) => item.product.id == productId,
      );

      if (item.quantity > 1) {
        item.quantity--;
      }
    });
  }

  void removeFromCart(int productId) {
    setState(() {
      cartItems.removeWhere(
        (item) => item.product.id == productId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      
      home: HomeScreen(
        onAddToCart: addToCart,
        cartItems: cartItems,
        onIncrease: addQuantity,
        onDecrease: removeQuantity,
        onRemove: removeFromCart,
      ),
    );
  }
}

