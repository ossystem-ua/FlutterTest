import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_machine/bloc/photo_bloc.dart';
import 'package:flutter_test_machine/bloc/photo_state.dart';
import 'package:flutter_test_machine/bloc/widgets/photo_item.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter photos list'),
      ),
      body: Center(
        child: BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
          switch (state.status) {
            case PhotoStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case PhotoStatus.success:
              if (state.photos.isEmpty) {
                return const Center(child: Text('no photos'));
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return PhotoItem(state.photos[index], index);
                },
                itemCount: state.photos.length,
              );
            case PhotoStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
