
class JokeQuery {
  final int page;
  final int limit;

  const JokeQuery({
    this.page = 1,
    this.limit = 15,
  });

  JokeQuery copyWith({
    int? page,
    int? limit,
  }) {
    return JokeQuery(
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
