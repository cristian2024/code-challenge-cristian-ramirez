import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_can_haz_dad_joke/bloc/random_joke/random_joke_cubit.dart';
import 'package:i_can_haz_dad_joke/domain.dart';

class RandomJokeScreen extends StatelessWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => refreshJoke(context),
      onDoubleTap: () => refreshJoke(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
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
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
    );
  }

  void refreshJoke(BuildContext context) {
    context.read<RandomJokeCubit>().getRandomJoke();
  }
}
