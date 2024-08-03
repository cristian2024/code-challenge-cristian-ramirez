import 'package:i_can_haz_dad_joke/data.dart'
    show JokeModelCommon, JokePaginationModel;

class JokesListResponseModel {
  final JokePaginationModel paginationData;
  final List<JokeModelCommon> jokes;
  JokesListResponseModel({
    required this.paginationData,
    required this.jokes,
  });

  JokesListResponseModel copyWith({
    JokePaginationModel? paginationData,
    List<JokeModelCommon>? jokes,
  }) {
    return JokesListResponseModel(
      paginationData: paginationData ?? this.paginationData,
      jokes: jokes ?? this.jokes,
    );
  }

  factory JokesListResponseModel.fromMap(Map<String, dynamic> map) {
    return JokesListResponseModel(
      paginationData: JokePaginationModel.fromMap(map),
      jokes: List<JokeModelCommon>.from(
        (map['results'] as List).map<JokeModelCommon>(
          (x) => JokeModelCommon.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

// $ curl -H "Accept: application/json" https://icanhazdadjoke.com/search
// {
//   "current_page": 1,
//   "limit": 20,
//   "next_page": 2,
//   "previous_page": 1,
//   "results": [
//     {
//       "id": "M7wPC5wPKBd",
//       "joke": "Did you hear the one about the guy with the broken hearing aid? Neither did he."
//     },
//     {
//       "id": "MRZ0LJtHQCd",
//       "joke": "What do you call a fly without wings? A walk."
//     },
//     ...
//     {
//       "id": "usrcaMuszd",
//       "joke": "What's the worst thing about ancient history class? The teachers tend to Babylon."
//     }
//   ],
//   "search_term": "",
//   "status": 200,
//   "total_jokes": 307,
//   "total_pages": 15
// }