import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Catalog'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
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
              child: GridView.builder(
                itemCount: 4,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final products = [
                    {
                      'name': 'Laptop',
                      'price': 999.99,
                      'image': 'assets/images/laptop.jpg',
                    },
                    {
                      'name': 'Telefon',
                      'price': 699.99,
                      'image': 'assets/images/phone.jpg',
                    },
                    {
                      'name': 'Kulaklık',
                      'price': 129.99,
                      'image': 'assets/images/headphones.jpg',
                    },
                    {
                      'name': 'Akıllı Saat',
                      'price': 249.99,
                      'image': 'assets/images/watch.jpg',
                    },
                  ];

                  final product = products[index];

                  return ProductCard(
                    name: product['name'] as String,
                    price: product['price'] as double,
                    imagePath: product['image'] as String,
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