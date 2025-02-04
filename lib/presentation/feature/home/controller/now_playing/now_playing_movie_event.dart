part of 'now_playing_movie_bloc.dart';

sealed class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();
}


class GetNowPlayingApiRequestEvent extends NowPlayingEvent {
  final String language;
  final int pageNo;

  const GetNowPlayingApiRequestEvent(
      {required this.language, required this.pageNo});

  @override
  List<Object?> get props => [language, pageNo];
}

