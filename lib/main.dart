import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        // themeMode: ThemeMode.dark,
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

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

enum Page {
  randomJoke(0),
  listJokes(1);

  const Page(this.indexx);
  //index is already used by enum class
  final int indexx;
}

extension PageIntExtension on int {
  Page getPage() {
    return switch (this) {
      0 => Page.randomJoke,
      1 => Page.listJokes,
      _ => throw Exception()
    };
  }
}

class _AppState extends State<App> {
  Page actualPage = Page.randomJoke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return switch (actualPage) {
            Page.listJokes => const JokesListScreen(),
            Page.randomJoke => const RandomJokeScreen()
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: actualPage.index,
        onTap: (value) {
          setState(() {
            actualPage = value.getPage();
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            tooltip: "Random joke",
            label:  "Random jokes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            tooltip: "Jokes list",
            label: "Jokes list",
          ),
        ],
      ),
    );
  }
}
