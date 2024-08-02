import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:i_can_haz_dad_joke/domain.dart';

part 'random_joke_state.dart';

class RandomJokeCubit extends Cubit<RandomJokeState> {
  RandomJokeCubit(this._repository) : super(const RandomJokeState());

  final JokesRepository _repository;

  Future<void> getRandomJoke() async {
    try {
      emit(state.copyWith(status: Status.loading));
      final joke = await _repository.getRandomJoke();
      emit(state.copyWith(
        status: Status.finished,
        joke: joke,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: Status.error,
      ));
    }
  }
}
