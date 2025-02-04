part of 'top_rated_movie_bloc.dart';



class  TopRatedState  extends Equatable {
   final bool showLoader;
   final String hasMessage;
   final String hasError;
   final TopRatedMovieResModel? topRatedMovieResModel;

  @override
  List<dynamic> get props => [showLoader , hasMessage , hasError , topRatedMovieResModel];

   const TopRatedState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
     this.topRatedMovieResModel,
  });

   TopRatedState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    TopRatedMovieResModel? topRatedMovieResModel,
  }) {
    return TopRatedState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      topRatedMovieResModel:
          topRatedMovieResModel ?? this.topRatedMovieResModel,
    );
  }


}
