part of 'jokes_bloc.dart';

abstract class JokesEvent extends Equatable {
  const JokesEvent();

  @override
  List<Object> get props => [];
}

class GetNextJokeListEvent extends JokesEvent {}

class ClearListJokesEvent extends JokesEvent {}


