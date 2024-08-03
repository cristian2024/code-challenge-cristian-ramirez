import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_can_haz_dad_joke/data.dart';
import 'package:i_can_haz_dad_joke/domain.dart';

part 'jokes_events.dart';
part 'jokes_state.dart';

typedef JokesEmitter = Emitter<JokesState>;

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  JokesBloc(this._repository)
      : super(
          const JokesState(query: JokeQuery()),
        ) {
    on<GetNextJokeListEvent>(_getNextJokes);
    on<ClearListJokesEvent>(
      (event, emit) {
        emit(state.copyWith(jokes: [], query: const JokeQuery()));
        add(GetNextJokeListEvent());
      },
    );
  }

  final JokesRepository _repository;

  //* InitialJokesEvent
  Future<void> _getNextJokes(
    GetNextJokeListEvent event,
    JokesEmitter emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final jokes = await _repository.getJokes(state.query);
      final query = state.query.copyWith(
        page: jokes.paginationData.nextPage,
      );
      emit(state.copyWith(
        status: Status.finished,
        query: query,
        jokes: [...state.jokes, ...jokes.jokes],
      ));
    } catch (error) {
      emit(state.copyWith(
        status: Status.error,
      ));
    }
  }
}
