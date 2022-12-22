import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  const Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int id;
  final String title;
  final int albumId;
  final String url;
  final String thumbnailUrl;

  @override
  List<Object> get props => [id, albumId, title, url, thumbnailUrl];
}
