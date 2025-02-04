part of 'upcoming_movies_bloc.dart';

class UpcomingMoviesState extends Equatable {
  final bool showLoader;
  final String hasMessage;
  final String hasError;
  final MovieResModel? movieResModel;

  @override
  List<Object?> get props => [showLoader, hasMessage, hasError, movieResModel];

  const UpcomingMoviesState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
    this.movieResModel,
  });

  UpcomingMoviesState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    MovieResModel? movieResModel,
  }) {
    return UpcomingMoviesState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      movieResModel: movieResModel ?? this.movieResModel,
    );
  }
}
