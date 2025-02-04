part of 'top_rated_movie_bloc.dart';

sealed class TopRatedEvent extends Equatable {
  const TopRatedEvent();
}



class GetTopRatedMoviesApiRequestEvent extends TopRatedEvent {
  final String language;
  final int pageNo;

  const GetTopRatedMoviesApiRequestEvent(
      {required this.language, required this.pageNo});

  @override
  List<Object?> get props => [language, pageNo];
}

