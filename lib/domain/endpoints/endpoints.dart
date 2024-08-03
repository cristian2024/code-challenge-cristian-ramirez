abstract class Endpoints {
  static const String _baseJokeEndpoint = 'https://icanhazdadjoke.com/';

  static const String randomJokeEndpoint = _baseJokeEndpoint;
  static String jokeList({
    int page = 1,
    int limit = 15,
  }) =>
      '${_baseJokeEndpoint}search?page=$page&limit=$limit';
}
