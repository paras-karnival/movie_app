part of 'upcoming_movies_bloc.dart';



 class  UpcomingMoviesState extends Equatable{

   final bool showLoader;
   final String hasMessage;
   final String hasError;
   final UpcomingMovieResModel? upcomingMovieResModel;

  @override
  List<Object?> get props => [showLoader , hasMessage , hasError , upcomingMovieResModel];

   const UpcomingMoviesState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
     this.upcomingMovieResModel,
  });

   UpcomingMoviesState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    UpcomingMovieResModel? upcomingMovieResModel,
  }) {
    return UpcomingMoviesState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      upcomingMovieResModel:
          upcomingMovieResModel ?? this.upcomingMovieResModel,
    );
  }


}
