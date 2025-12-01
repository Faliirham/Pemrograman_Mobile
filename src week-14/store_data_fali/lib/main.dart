import 'package:flutter/material.dart';
import 'dart:convert';
import './model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './httphelper.dart';
import 'pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fali- Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pwdController = TextEditingController();
  final storage = const FlutterSecureStorage();
  final String myKey = "myPass";

  late File myFile;
  String fileText = '';
  String documentsPath = '';
  String tempPath = '';
  int appCounter = 0;

  // Call API pizzas
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    return await helper.getPizzaList();
  }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureData() async {
    return await storage.read(key: myKey) ?? '';
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margaretha, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() => fileText = fileContent);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString =
        await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);

    List<Pizza> myPizzas =
        pizzaMapList.map((json) => Pizza.fromJson(json)).toList();

    String json = convertToJson(myPizzas);
    print(json);

    return myPizzas;
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', appCounter);

    setState(() {});
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() => appCounter = 0);
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    documentsPath = docDir.path;
    tempPath = tempDir.path;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPaths().then((_) {
      myFile = File('$documentsPath/pizzas.txt');
      writeFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fali - JSON'),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<Pizza>>(
        future: callPizzas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final pizzas = snapshot.data!;

          return ListView.builder(
          itemCount: pizzas.length,
          itemBuilder: (BuildContext context, int position) {
            final pizza = pizzas[position];

            return Dismissible(
              key: Key(pizza.id.toString()),
              onDismissed: (item) {
                HttpHelper helper = HttpHelper();

                setState(() {
                  pizzas.removeAt(position);
                });

                helper.deletePizza(pizza.id);
              },
              child: ListTile(
                title: Text(pizza.pizzaName),
                subtitle: Text('${pizza.description} - €${pizza.price}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PizzaDetailScreen(pizza: pizza, isNew: false),
                    ),
                  );
                },
              ),
            );
          },
        );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PizzaDetailScreen(
                        isNew: true,),
            ),
          );
        },
      ),
    );
  }
}