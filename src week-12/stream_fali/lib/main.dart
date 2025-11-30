import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fali - Stream',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 110, 159)),
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;
  late StreamSubscription<int> subscription;

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Stream sudah ditutup!')),
      );
    }
  }

  void stopStream() {
    if (!numberStreamController.isClosed) {
      numberStreamController.close();
    }
  }

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    
    subscription = numberStreamController.stream.listen(
      (event) {
        setState(() {
          lastNumber = event;
        });
      },
      onError: (error) {
        setState(() {
          lastNumber = -1;
        });
      },
      onDone: () {
        print('OnDone was called');
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    if (!numberStreamController.isClosed) {
      numberStreamController.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fali - Stream'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(fontSize: 48),
            ),
            ElevatedButton(
              onPressed: numberStreamController.isClosed ? null : addRandomNumber,
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: numberStreamController.isClosed ? null : stopStream,
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}