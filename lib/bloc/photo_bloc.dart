import 'package:bloc/bloc.dart';
import 'package:flutter_test_machine/bloc/photo_event.dart';
import 'package:flutter_test_machine/bloc/photo_state.dart';
import 'package:flutter_test_machine/repository/photo_repository.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository _photoRepository;
  PhotoBloc(this._photoRepository) : super(const PhotoState()) {
    on<PhotoFetched>(_onPhotoFetched);
  }

  _onPhotoFetched(
    PhotoFetched event,
    Emitter<PhotoState> emit,
  ) async {
    try {
      if (state.status == PhotoStatus.initial) {
        final photos = await _photoRepository.getListOfPhoto();
        return emit(
            state.copyWith(status: PhotoStatus.success, photos: photos));
      }
    } catch (err) {
      emit(state.copyWith(status: PhotoStatus.failure));
    }
  }
}
