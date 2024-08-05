import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_can_haz_dad_joke/app.dart';
import 'package:i_can_haz_dad_joke/data.dart';
import 'package:i_can_haz_dad_joke/ui.dart';
import 'package:i_can_haz_dad_joke/bloc/jokes/jokes_bloc.dart';
import 'package:i_can_haz_dad_joke/bloc/random_joke/random_joke_cubit.dart';

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
        BlocProvider(
          create: (context) => JokesBloc(
            repository,
          )..add(GetNextJokeListEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Random dad jokes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          textTheme: baseTextTheme.call(),
        ),
        home: const App(),
      ),
    );
  }
}
