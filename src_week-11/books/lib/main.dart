import 'dart:async';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  String result = '';

  Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count () async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/ivYYEQAAQBAJ';

    return http.get(Uri.https(authority, path));
  }

  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    await Future.delayed(const Duration(seconds : 5));
    completer.complete(42);
  }

  Future calculate2() async {
    try {
      await new Future.delayed(const Duration(seconds : 5));
      completer.complete(42);
    } catch (e) {
      completer.completeError({});
    }
  }

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened');
  }

  void returnFG (){
    // FutureGroup<int> futureGroup = FutureGroup<int>();
    // futureGroup.add(returnOneAsync());
    // futureGroup.add(returnTwoAsync());
    // futureGroup.add(returnThreeAsync());
    // futureGroup.close();
    // futureGroup.future.then((List <int> values) {
    //   int total = 0;
    //   for (var element in values) {
    //     total += element;
    //   }
    //   setState(() {
    //     result = total.toString();
    //   });
    // });

    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fali Irham - Back from the Future'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              // onPressed: () {
              //   setState(() {});

              //   getData().then((value) {
              //     result = value.body.toString().substring(0, 450);
              //     setState(() {});
              //   }).catchError((_) {
              //     result = 'An error occurred';
              //     setState(() {});
              //   });
              // },
              // onPressed: () {
              //   count();
              // },
              onPressed: () {
                returnError()
                    .then((value) {
                      setState(() {
                        result = 'Success';
                      });
                    })
                    .catchError((onError) {
                      setState(() {
                        result = onError.toString();
                      });
                    })
                    .whenComplete(() {
                      print('Future is complete');
                    });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}