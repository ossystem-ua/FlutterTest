import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_machine/bloc/photo_bloc.dart';
import 'package:flutter_test_machine/bloc/photo_event.dart';
import 'package:flutter_test_machine/repository/photo_repository.dart';
import 'package:flutter_test_machine/screens/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (_) => PhotoRepository(),
        child: BlocProvider(
          create: (repo) =>
              PhotoBloc(RepositoryProvider.of<PhotoRepository>(repo))
                ..add(PhotoFetched()),
          child: const PhotoList(),
        ),
      ),
    );
  }
}
