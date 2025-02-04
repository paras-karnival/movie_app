part of 'home_bloc.dart';

 class HomeState extends Equatable {

   final bool showLoader;
   final String hasMessage;
   final String  hasError;
   final PopularMoviesResModel? popularMoviesResModel;

   const HomeState({
    required this.showLoader,
    required this.hasMessage,
    required this.hasError,
     this.popularMoviesResModel,
  });

   HomeState copyWith({
    bool? showLoader,
    String? hasMessage,
    String? hasError,
    PopularMoviesResModel? popularMoviesResModel,
  }) {
    return HomeState(
      showLoader: showLoader ?? this.showLoader,
      hasMessage: hasMessage ?? this.hasMessage,
      hasError: hasError ?? this.hasError,
      popularMoviesResModel:
          popularMoviesResModel ?? this.popularMoviesResModel,
    );
  }

  @override
  List<Object?> get props => [
    showLoader , hasMessage , hasError , popularMoviesResModel
  ];

}



