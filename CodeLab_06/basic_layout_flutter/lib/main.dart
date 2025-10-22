import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Profile Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const CatProfileLayout(),
    );
  }
}

class CatProfileLayout extends StatelessWidget {
  const CatProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Title Section
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'Kucing Anggora',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Text(
            'Kucing Anggora dikenal karena bulunya yang panjang, lembut, dan elegan. '
            'Mereka memiliki sifat ramah, aktif, dan sangat menyukai perhatian manusia. '
            'Kucing ini cocok dijadikan hewan peliharaan karena mudah beradaptasi di rumah.',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

    // Stars rating section with colored border
    Widget stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(Icons.star, color: Colors.orange[400]),
      ),
    );

    Widget ratingsSection = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange.shade200, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.orange.shade50,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '120 Likes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

    // Info section
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    Widget iconSection = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.pets, color: Colors.orange[500]),
                const Text('USIA:'),
                const Text('2 Tahun'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.favorite, color: Colors.pink[400]),
                const Text('RASA SUKA:'),
                const Text('Ikan Tuna'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.home, color: Colors.green[400]),
                const Text('RUMAH:'),
                const Text('Jakarta'),
              ],
            ),
          ],
        ),
      ),
    );

    // Left column
    Widget leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          titleSection,
          ratingsSection,
          iconSection,
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profil Kucing Anggora'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 30),
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: leftColumn,
                  ),
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                        'images/cat.jpg', // ← ubah nama gambar di sini
                        fit: BoxFit.cover,
                        height: 600,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 600,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.pets,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Kucing Anggora',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}