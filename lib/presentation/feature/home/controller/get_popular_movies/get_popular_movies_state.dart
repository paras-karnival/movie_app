part of 'get_popular_movies_bloc.dart';

class GetPopularMoviesState extends Equatable {
  final bool showLoader;
  final String hasMessage;
  final String hasError;
  final PopularMoviesResModel? popularMoviesResModel;

  @override
  List<dynamic> get props =>
      [showLoader, hasError, hasMessage, popularMoviesResModel];

  const GetPopularMoviesState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
     this.popularMoviesResModel,
  });

  GetPopularMoviesState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    PopularMoviesResModel? popularMoviesResModel,
  }) {
    return GetPopularMoviesState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      popularMoviesResModel:
          popularMoviesResModel ?? this.popularMoviesResModel,
    );
  }
}
