abstract class JokeModel {
  final String joke;
  final String id;

  const JokeModel({
    required this.joke,
    required this.id,
  });
  

  @override
  String toString() {
    
    return joke;
  }
}
