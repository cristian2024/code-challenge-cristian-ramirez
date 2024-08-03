import 'package:i_can_haz_dad_joke/data.dart';
import 'package:i_can_haz_dad_joke/domain.dart' show JokeModel;

abstract class JokesRepository {
  Future<JokeModel> getRandomJoke();

  Future<JokesListResponseModel> getJokes(JokeQuery queryData);
}
