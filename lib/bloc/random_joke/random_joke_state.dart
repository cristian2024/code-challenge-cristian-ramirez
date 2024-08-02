
part of "random_joke_cubit.dart";

class RandomJokeState extends Equatable {
  final Status status;
  final JokeModel? joke;

  const RandomJokeState({
    this.status = Status.notInitiated,
    this.joke,
  });

  RandomJokeState copyWith({
    Status? status,
    JokeModel? joke,
  }) {
    return RandomJokeState(
      status: status ?? this.status,
      joke: joke ?? this.joke,
    );
  }

  @override
  List<Object?> get props => [status, joke];
}
