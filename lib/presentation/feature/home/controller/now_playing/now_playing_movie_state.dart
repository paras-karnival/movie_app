part of 'now_playing_movie_bloc.dart';

class NowPlayingState extends Equatable {
  final bool showLoader;
  final String hasMessage;
  final String hasError;
  final MovieResModel? movieResModel;

  @override
  List<dynamic> get props => [showLoader, hasMessage, hasError, movieResModel];

  const NowPlayingState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
    this.movieResModel,
  });

  NowPlayingState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    MovieResModel? movieResModel,
  }) {
    return NowPlayingState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      movieResModel: movieResModel ?? this.movieResModel,
    );
  }
}
