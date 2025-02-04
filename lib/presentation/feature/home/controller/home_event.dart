part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetPopularMoviesRequestHomeEvent extends HomeEvent {
  final String language;
  final int pageNo;

  const GetPopularMoviesRequestHomeEvent(
      {required this.language, required this.pageNo});
  @override
  List<Object?> get props => [language , pageNo];
}
