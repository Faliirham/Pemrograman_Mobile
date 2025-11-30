import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget{
  const NavigationDialogScreen ({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_){
        return AlertDialog(
          title: const Text('Very Important Question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Red'),
              onPressed: (){
                setState(() {
                  color = Colors.red.shade700;
                });
                Navigator.pop(context,color);
              }),
            TextButton(
              child: const Text('Pink'), 
              onPressed: (){
                setState(() {
                  color = Colors.pink.shade700;
                });
                Navigator.pop(context,color);
              }),
            TextButton(
              child: const Text('Black'),
              onPressed: (){
                setState(() {
                  color = Colors.black;
                });
                Navigator.pop(context,color);
              }),
          ],
        );
      }
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text(' Fali Irham - Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: (){
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}