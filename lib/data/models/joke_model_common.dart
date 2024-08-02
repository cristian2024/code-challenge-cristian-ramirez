import 'package:i_can_haz_dad_joke/domain.dart';

class JokeModelCommon extends JokeModel {
  JokeModelCommon({required super.joke, required super.id});

  factory JokeModelCommon.fromMap(Map<String, dynamic> map) {
    return JokeModelCommon(id: map['id'], joke: map['joke']);
  }
}
