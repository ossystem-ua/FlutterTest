import 'package:flutter/material.dart';
import 'package:flutter_test_machine/models/photo.dart';

class DetailedPhoto extends StatelessWidget {
  final Photo photo;
  final int index;
  const DetailedPhoto(this.photo, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detaled photo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(tag: 'img$index', child: Image.network(photo.url)),
                const SizedBox(height: 12),
                Text(photo.title)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
