import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCupertino extends StatelessWidget {
  const LoadingCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // biar nggak muncul label DEBUG
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CupertinoButton(
                child: Text("Contoh button"),
                onPressed: null, // tidak ada aksi (bisa diganti nanti)
              ),
              SizedBox(height: 20),
              CupertinoActivityIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}