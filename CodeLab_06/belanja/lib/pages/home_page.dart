import 'package:flutter/material.dart';
import '../model/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      image: 'images/sugar.jpg',
      stock: 20,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      image: 'images/salt.jpg',
      stock: 15,
      rating: 4.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Shopping List'),
        backgroundColor: Colors.blue[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/item',
                  arguments: item,
                );
              },
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: item.name,
                      child: Image.asset(
                        item.image,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(item.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Rp ${item.price}',
                        style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 5),
                    Text('Stok: ${item.stock}',
                        style: const TextStyle(fontSize: 12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(item.rating.toString(),
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue[800],
        padding: const EdgeInsets.all(8),
        child: const Text(
          'Fali Irham Maulana | 2341720121 | TI-3F',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}