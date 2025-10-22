import 'package:flutter/material.dart';
import '../model/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: itemArgs.name,
              child: Image.asset(
                itemArgs.image,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              itemArgs.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Harga: Rp ${itemArgs.price}',
                style: const TextStyle(fontSize: 18)),
            Text('Stok: ${itemArgs.stock}',
                style: const TextStyle(fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                Text(itemArgs.rating.toString(),
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}