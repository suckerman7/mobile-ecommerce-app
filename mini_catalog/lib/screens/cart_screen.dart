import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  final void Function(int productId) onIncrease;
  final void Function(int productId) onDecrease;
  final void Function(int productId) onRemove;

  const CartScreen({
      super.key,
      required this.cartItems,
      required this.onIncrease,
      required this.onDecrease,
      required this.onRemove,
    });

  double _calculateTotal() {
    return cartItems.fold(
      0,
      (total, item) => total + item.totalPrice,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
      ),

      body: cartItems.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 80,
                  color: Colors.grey.shade400,
                ),

                const SizedBox(height: 16),

                const Text(
                  'Sepetiniz boş',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Henüz sepetinize ürün eklemediniz.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final product = item.product;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Image.asset(
                              product.imagePath,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    '\$${item.totalPrice.toStringAsFixed(2)}',
                                  ),

                                  const SizedBox(height: 8),

                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          onDecrease(product.id);
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),

                                      Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          onIncrease(product.id);
                                        },
                                        icon: const Icon(Icons.add),
                                      ),

                                      const Spacer(),

                                      IconButton(
                                        onPressed: () {
                                          onRemove(product.id);
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Toplam:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                Text(
                  '\$${_calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}