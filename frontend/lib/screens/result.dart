import 'dart:io';

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final File image;
  final String confidence;

  const ResultScreen({Key? key, required this.result ,required this.image, required this.confidence}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'AI Model Result:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.file(image),
            const SizedBox(height: 10),
            Text(
              result,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              'Confidence: ' + confidence + '%',
              style: const TextStyle(fontSize: 18),
            ),

          ],
        ),
      ),
    );
  }
}
