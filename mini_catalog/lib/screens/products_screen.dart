import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/products.dart';
import '../services/product_service.dart';

class ProductsScreen extends StatelessWidget {
  final void Function(Product product) onAddToCart;
  
  const ProductsScreen({
    super.key,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürünler'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Product>>(
          future: ProductService().loadProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Hata: ${snapshot.error}',
                ),
              );
            }

            final products = snapshot.data ?? [];

            return GridView.builder(
              itemCount: products.length,
              gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    product: product,
                    onAddToCart: onAddToCart,
                  );
                },
            );
          },
        ),
      ),
    );
  }
}