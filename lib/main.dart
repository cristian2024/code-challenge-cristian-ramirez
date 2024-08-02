import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_can_haz_dad_joke/bloc/random_joke/random_joke_cubit.dart';
import 'package:i_can_haz_dad_joke/data.dart';
import 'package:i_can_haz_dad_joke/ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO(Cristian) - Inject with GetIt or with Provider
    final repository = JokesRepositoryCommon();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RandomJokeCubit(
            repository,
          )..getRandomJoke(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RandomJokeScreen(),
      ),
    );
  }
}
