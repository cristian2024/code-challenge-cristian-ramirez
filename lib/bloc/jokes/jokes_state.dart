part of 'jokes_bloc.dart';

class JokesState extends Equatable {
  final Status status;
  final List<JokeModel> jokes;
  final JokeQuery query;

  const JokesState({
    this.status = Status.notInitiated,
    this.jokes = const [],
    required this.query,
  });

  @override
  List<Object?> get props => [status, jokes,query];

  bool get isInitial => status == Status.notInitiated;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.finished;
  bool get isFailure => status == Status.error;

  JokesState copyWith({
    Status? status,
    List<JokeModel>? jokes,
    JokeQuery? query,
  }) {
    return JokesState(
      query: query ?? this.query,
      status: status ?? this.status,
      jokes: jokes ?? this.jokes,
    );
  }
}
