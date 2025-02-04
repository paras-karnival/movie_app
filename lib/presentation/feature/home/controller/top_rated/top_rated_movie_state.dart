part of 'top_rated_movie_bloc.dart';

class TopRatedState extends Equatable {
  final bool showLoader;
  final String hasMessage;
  final String hasError;
  final MovieResModel? movieResModel;

  @override
  List<dynamic> get props => [showLoader, hasMessage, hasError, movieResModel];

  const TopRatedState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
    this.movieResModel,
  });

  TopRatedState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    MovieResModel? movieResModel,
  }) {
    return TopRatedState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      movieResModel: movieResModel ?? this.movieResModel,
    );
  }
}
