import 'package:flutter/material.dart';
import 'package:flutter_test_machine/models/photo.dart';
import 'package:flutter_test_machine/screens/detailed_view.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;
  final int index;
  const PhotoItem(this.photo, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailedPhoto(photo, index),
              ),
            );
          },
          child: SizedBox(
            width: 150,
            child: Row(
              children: [
                Hero(
                    tag: 'img$index', child: Image.network(photo.thumbnailUrl)),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('id: ${photo.id}'),
                      const SizedBox(height: 8),
                      Text('albumId: ${photo.albumId}'),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 150,
                        child: Text(
                          photo.title,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
