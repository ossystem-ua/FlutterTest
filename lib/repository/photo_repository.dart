import 'package:dio/dio.dart';
import 'package:flutter_test_machine/constants/api.dart';
import 'package:flutter_test_machine/models/photo.dart';

class PhotoRepository {
  late final Dio _dioClient;

  PhotoRepository() {
    _dioClient = Dio();
  }

  Future<List<Photo>> getListOfPhoto() async {
    final response = await _dioClient.get(PHOTOS_URL);
    if (response.statusCode == 200) {
      final list = (response.data as List).map((dynamic item) {
        return Photo(
          id: item['id'] as int,
          title: item['title'] as String,
          albumId: item['albumId'] as int,
          url: item['url'] as String,
          thumbnailUrl: item['thumbnailUrl'] as String,
        );
      });
      return list.toList();
    }
    throw Exception('error fetching photos');
  }
}
