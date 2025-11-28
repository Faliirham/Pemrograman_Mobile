import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Futurepage(),
    );
  }
}

class Futurepage extends StatefulWidget {
  const Futurepage({super.key});

  @override
  State<Futurepage> createState() => _FuturePageState();
}

class _FuturePageState extends State<Futurepage> {
  const Futurepage({super.key});


  Future<Response> getData() async {
   const authority = 'www.googleapis.com';
   const path = '/books/v1/volumes/ivYYEQAAQBAJ';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fali Irham - Back from the Future'),
      ),
      body: Center(
        child: Column(children : [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {},
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator()
          const Spacer(),
        ])
      ),
    );
  }
}


