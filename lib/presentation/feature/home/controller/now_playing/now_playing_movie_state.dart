part of 'now_playing_movie_bloc.dart';

class NowPlayingState extends Equatable {
  final bool showLoader;
  final String hasMessage;
  final String hasError;
  final NowPlayingMovieResModel? nowPlayingMovieResModel;

  @override
  List<dynamic> get props =>
      [showLoader, hasMessage, hasError, nowPlayingMovieResModel];

  const NowPlayingState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
     this.nowPlayingMovieResModel,
  });

  NowPlayingState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    NowPlayingMovieResModel? nowPlayingMovieResModel,
  }) {
    return NowPlayingState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      nowPlayingMovieResModel:
          nowPlayingMovieResModel ?? this.nowPlayingMovieResModel,
    );
  }
}
