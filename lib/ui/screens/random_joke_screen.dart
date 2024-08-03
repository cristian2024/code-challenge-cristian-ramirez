import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_can_haz_dad_joke/bloc/random_joke/random_joke_cubit.dart';
import 'package:i_can_haz_dad_joke/domain.dart';

class RandomJokeScreen extends StatelessWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO(Cristian) - improve theme calls
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //TODO(Cristian) - improve text management
        title: const Text("Random Joke"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        alignment: Alignment.center,
        child: BlocBuilder<RandomJokeCubit, RandomJokeState>(
          builder: (context, state) {
            final RandomJokeState(:status, :joke) = state;
            if (status == Status.loading) {
              return const CircularProgressIndicator();
            } else if (status == Status.finished && joke == null) {
              //TODO(Cristian) - deal with border case
              
              return const CircularProgressIndicator();
            }
            return Text(
              joke?.joke ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => refreshJoke(context),
        tooltip: 'Refresh joke',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void refreshJoke(BuildContext context) {
    context.read<RandomJokeCubit>().getRandomJoke();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
