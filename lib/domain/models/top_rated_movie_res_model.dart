import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_movie_res_model.freezed.dart';
part 'top_rated_movie_res_model.g.dart';

@freezed
class TopRatedMovieResModel with _$TopRatedMovieResModel {
  factory TopRatedMovieResModel({
    int? page,
    List<Result>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _TopRatedMovieResModel;

  factory TopRatedMovieResModel.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMovieResModelFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}