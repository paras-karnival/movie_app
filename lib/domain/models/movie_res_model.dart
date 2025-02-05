import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_res_model.freezed.dart';

part 'movie_res_model.g.dart';

@freezed
class MovieResModel with _$MovieResModel {
  factory MovieResModel({
    @Default([]) List<Result>? results,
  }) = _MovieResModel;

  factory MovieResModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResModelFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    String? title,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
