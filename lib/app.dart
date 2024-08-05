import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_can_haz_dad_joke/ui.dart';
import 'package:i_can_haz_dad_joke/bloc/random_joke/random_joke_cubit.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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

  /// this subscription is used for check internet connection
  late StreamSubscription<InternetStatus> listener;

  @override
  void initState() {
    listener = InternetConnection().onStatusChange.listen(onStatusChange);
    super.initState();
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  void onStatusChange(InternetStatus status) {
    if (status == InternetStatus.disconnected) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NoInternetScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO(Cristian) - improve theme calls
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //TODO(Cristian) - improve text management
        title: const Text("Random Joke"),
      ),
      body: Builder(
        builder: (context) {
          return switch (actualPage) {
            Page.listJokes => const JokesListScreen(),
            Page.randomJoke => const RandomJokeScreen()
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => refreshJoke(context),
        tooltip: 'Refresh joke',
        child: const Icon(Icons.refresh),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: actualPage.index,
        onTap: (value) {
          final page = value.getPage();
          if (page == actualPage) {
            if (page == Page.randomJoke) {
              context.read<RandomJokeCubit>().getRandomJoke();
            }
            //it is not necessary to reload anything
            return;
          }
          setState(() {
            actualPage = page;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            tooltip: "Random joke",
            label: "Random jokes",
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

  void refreshJoke(BuildContext context) {
    context.read<RandomJokeCubit>().getRandomJoke();
    //validating that the screen is in the random joke
    if (actualPage != Page.randomJoke) {
      setState(() {
        actualPage = Page.randomJoke;
      });
    }
  }
}
