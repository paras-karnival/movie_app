part of 'get_popular_movies_bloc.dart';

sealed class GetPopularMoviesEvent extends Equatable {
  const GetPopularMoviesEvent();
}


class GetPopularMoviesAPIRequestEvent extends GetPopularMoviesEvent {
  final String language;
  final int pageNo;

  const GetPopularMoviesAPIRequestEvent(
      {required this.language, required this.pageNo});

  @override
  List<Object?> get props => [language, pageNo];
}
