part of 'get_popular_movies_bloc.dart';

class GetPopularMoviesState extends Equatable {
  final bool showLoader;
  final String hasMessage;
  final String hasError;
  final MovieResModel? movieResModel;

  @override
  List<dynamic> get props => [showLoader, hasError, hasMessage, movieResModel];

  const GetPopularMoviesState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
    this.movieResModel,
  });

  GetPopularMoviesState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    MovieResModel? movieResModel,
  }) {
    return GetPopularMoviesState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      movieResModel: movieResModel ?? this.movieResModel,
    );
  }
}
