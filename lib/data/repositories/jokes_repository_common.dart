import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:i_can_haz_dad_joke/data/models/joke_model_common.dart';

import 'package:i_can_haz_dad_joke/domain.dart';

class JokesRepositoryCommon extends JokesRepository {
  @override
  Future<JokeModel> getRandomJoke() async {
    try {
      final endpoint = Uri.parse(Endpoints.randomJokeEndpoint);
      final response = await http.get(
        endpoint,
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode != 200) {
        //TODO(Cristian) - custom exception management
        throw Exception();
      }
      final jokeBody = jsonDecode(response.body);
      return JokeModelCommon.fromMap(jokeBody);
    } catch (e) {
      //TODO(Cristian) - Exception management
      rethrow;
    }
  }
}


// $ curl -H "Accept: application/json" https://icanhazdadjoke.com/
// {
//   "id": "R7UfaahVfFd",
//   "joke": "My dog used to chase people on a bike a lot. It got so bad I had to take his bike away.",
//   "status": 200
// }