import 'dart:io';

import 'package:flutter/material.dart';

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final Color filterColor;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    this.filterColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fali irham Maulana - 2341720121')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            filterColor.withOpacity(0.5),
            BlendMode.color,
          ),
          child: Image.file(File(imagePath)),
        ),
      ),
    );
  }
}