import 'package:freezed_annotation/freezed_annotation.dart';

part 'now_playing_movie_res_model.freezed.dart';
part 'now_playing_movie_res_model.g.dart';

@freezed
class NowPlayingMovieResModel with _$NowPlayingMovieResModel {
  factory NowPlayingMovieResModel({
    Dates? dates,
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) = _NowPlayingMovieResModel;

  factory NowPlayingMovieResModel.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMovieResModelFromJson(json);
}

@freezed
class Dates with _$Dates {
  factory Dates({
      String? maximum,
      String? minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
class Movie with _$Movie {
  factory Movie({
      bool? adult,
    @JsonKey(name: 'backdrop_path')   String? backdropPath,
    @JsonKey(name: 'genre_ids')   List<int>? genreIds,
      int? id,
    @JsonKey(name: 'original_language')   String? originalLanguage,
    @JsonKey(name: 'original_title')   String? originalTitle,
      String? overview,
      double? popularity,
    @JsonKey(name: 'poster_path')   String? posterPath,
    @JsonKey(name: 'release_date')   String? releaseDate,
      String? title,
      bool? video,
    @JsonKey(name: 'vote_average')   double? voteAverage,
    @JsonKey(name: 'vote_count')   int? voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
