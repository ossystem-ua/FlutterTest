import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PhotoFetched extends PhotoEvent {}
