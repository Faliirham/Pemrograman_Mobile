import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan label debug
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contoh Floating Action Button"),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Tekan tombol di bawah!',
            style: TextStyle(fontSize: 18),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Tambahkan aksi di sini, misalnya print ke console
            debugPrint('Tombol FAB ditekan!');
          },
          backgroundColor: Colors.pink,
          child: const Icon(Icons.thumb_up),
        ),
      ),
    );
  }
}