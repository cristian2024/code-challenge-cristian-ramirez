import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_can_haz_dad_joke/bloc/jokes/jokes_bloc.dart';
import 'package:i_can_haz_dad_joke/domain.dart';

class JokesListScreen extends StatefulWidget {
  const JokesListScreen({super.key});

  @override
  State<JokesListScreen> createState() => _JokesListScreenState();
}

class _JokesListScreenState extends State<JokesListScreen> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ///listens when the user is at the bottom of the list
  void listener() {
    //TODO(Cristian) - Validate when it's the end of the list
    final ScrollPosition(
      :pixels,
      :maxScrollExtent,
    ) = _scrollController.position;
    if (pixels == maxScrollExtent) {
      //TODO(Cristian) - call next item
      context.read<JokesBloc>().add(GetNextJokeListEvent());
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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        alignment: Alignment.center,
        child: BlocBuilder<JokesBloc, JokesState>(
          builder: (context, state) {
            final JokesState(:isLoading, :jokes, :isSuccess) = state;
            if (isLoading && jokes.isEmpty) {
              return const CircularProgressIndicator();
            } else if (isSuccess && jokes.isEmpty) {
              //TODO(Cristian) - deal with border case

              return const CircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: jokes.length,
                    itemBuilder: (context, index) {
                      final joke = jokes[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          joke.joke,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
                if (state.isLoading) const CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO(Cristian) - función para recargar
        },
        tooltip: 'Refresh list',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
