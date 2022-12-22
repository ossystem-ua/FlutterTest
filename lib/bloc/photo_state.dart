import 'package:equatable/equatable.dart';
import 'package:flutter_test_machine/models/photo.dart';

enum PhotoStatus { initial, success, failure }

class PhotoState extends Equatable {
  const PhotoState({
    this.status = PhotoStatus.initial,
    this.photos = const <Photo>[],
    this.hasReachedMax = false,
  });

  final PhotoStatus status;
  final List<Photo> photos;
  final bool hasReachedMax;

  PhotoState copyWith({
    PhotoStatus? status,
    List<Photo>? photos,
  }) {
    return PhotoState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, posts: ${photos.length} }''';
  }

  @override
  List<Object> get props => [status, photos];
}
