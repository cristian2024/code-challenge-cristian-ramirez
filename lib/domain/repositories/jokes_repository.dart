import 'package:i_can_haz_dad_joke/domain.dart' show JokeModel;

abstract class JokesRepository {
  Future<JokeModel> getRandomJoke();
}
