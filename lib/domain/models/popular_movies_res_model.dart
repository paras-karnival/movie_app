import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_movies_res_model.freezed.dart';
part 'popular_movies_res_model.g.dart';

@freezed
class PopularMoviesResModel with _$PopularMoviesResModel {
  const factory PopularMoviesResModel({
     int? page,
     List<Movie>? results,
  }) = _PopularMoviesResModel;

  factory PopularMoviesResModel.fromJson(Map<String, dynamic> json) => _$PopularMoviesResModelFromJson(json);
}

@freezed
class Movie with _$Movie {
  const factory Movie({
     bool? adult,
    @JsonKey(name: 'backdrop_path')  String? backdropPath,
    @JsonKey(name: 'genre_ids')  List<int>? genreIds,
     int? id,
    @JsonKey(name: 'original_language')  String? originalLanguage,
    @JsonKey(name: 'original_title')  String? originalTitle,
     String? overview,
     double? popularity,
    @JsonKey(name: 'poster_path')  String? posterPath,
    @JsonKey(name: 'release_date')  String? releaseDate,
     String? title,
     bool? video,
    @JsonKey(name: 'vote_average')  double? voteAverage,
    @JsonKey(name: 'vote_count')  int? voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
