import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_movie_res_model.freezed.dart';
part 'upcoming_movie_res_model.g.dart';

@freezed
class UpcomingMovieResModel with _$UpcomingMovieResModel {
  factory UpcomingMovieResModel({
    Dates? dates,
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) = _UpcomingMovieResModel;

  factory UpcomingMovieResModel.fromJson(Map<String, dynamic> json) => _$UpcomingMovieResModelFromJson(json);
}

@freezed
class Dates with _$Dates {
  factory Dates({
    DateTime? maximum,
    DateTime? minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    bool? adult,
  @JsonKey(name: "backdrop_path")  String? backdropPath,
    @JsonKey(name: "genre_ids")  List<int>? genreIds,
    int? id,
    @JsonKey(name: "original_language")  String? originalLanguage,
    @JsonKey(name: "original_title")   String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: "poster_path")  String? posterPath,
    @JsonKey(name: "release_date")  DateTime? releaseDate,
    String? title,
    bool? video,
    @JsonKey(name: "vote_average")  double? voteAverage,
    int? voteCount,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}