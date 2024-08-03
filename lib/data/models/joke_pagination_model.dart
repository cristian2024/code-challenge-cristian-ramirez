class JokePaginationModel {
  final int currentPage;
  final int limit;
  final int nextPage;
  final int total;
  final int totalPage;

  const JokePaginationModel({
    required this.currentPage,
    required this.limit,
    required this.nextPage,
    required this.total,
    required this.totalPage,
  });

  JokePaginationModel copyWith({
    int? currentPage,
    int? limit,
    int? nextPage,
    int? total,
    int? totalPage,
  }) {
    return JokePaginationModel(
      currentPage: currentPage ?? this.currentPage,
      limit: limit ?? this.limit,
      nextPage: nextPage ?? this.nextPage,
      total: total ?? this.total,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  factory JokePaginationModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return JokePaginationModel(
      currentPage: map['current_page'] as int,
      limit: map['limit'] as int,
      nextPage: map['next_page'] as int,
      total: map['total_jokes'] as int,
      totalPage: map['total_pages'] as int,
    );
  }
}




