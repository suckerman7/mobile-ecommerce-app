import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import 'products_screen.dart';
import 'cart_screen.dart';

import '../models/products.dart';
import '../models/cart_item.dart';
import '../services/product_service.dart';

class HomeScreen extends StatelessWidget {
  final void Function(Product product) onAddToCart;
  final List<CartItem> cartItems;

  final void Function(int productId) onIncrease;
  final void Function(int productId) onDecrease;
  final void Function(int productId) onRemove;

  const HomeScreen({
    super.key,
    required this.onAddToCart,
    required this.cartItems,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  int get cartItemCount {
    return cartItems.fold(
      0,
      (total, item) => total + item.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Catalog'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: cartItems,
                    onIncrease: onIncrease,
                    onDecrease: onDecrease,
                    onRemove: onRemove,
                  ),
                ),
              );
            },
            icon: Badge(
              label: Text('$cartItemCount'),
              isLabelVisible: cartItemCount > 0,
              child: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ürünler',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Favori ürünlerini keşfet.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsScreen(
                      onAddToCart: onAddToCart,
                    ), 
                  ),
                );
              },
              child: const Text('Tüm Ürünleri Gör'),
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Ürün ara...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryChip('Tümü'),
                  _buildCategoryChip('Elektronik'),
                  _buildCategoryChip('Aksesuar'),
                  _buildCategoryChip('Giyim'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
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
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(title),
      ),
    );
  }
}