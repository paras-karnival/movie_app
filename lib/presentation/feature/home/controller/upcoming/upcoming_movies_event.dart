part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesEvent extends Equatable{
  const UpcomingMoviesEvent();
}


class GetUpcomingMoviesApiRequestEvent extends UpcomingMoviesEvent {
  final String language;
  final int pageNo;

  const GetUpcomingMoviesApiRequestEvent(
      {required this.language, required this.pageNo});

  @override
  List<Object?> get props => [language, pageNo];
}

