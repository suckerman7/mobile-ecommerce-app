// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/products.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Detayı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imagePath,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sepete Ekle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}