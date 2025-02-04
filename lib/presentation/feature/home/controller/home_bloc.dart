import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/config/dependency_injection/di.dart';
import 'package:movie_app/domain/models/popular_movies_res_model.dart';
import 'package:movie_app/domain/repositories/app_repo/app_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(
    hasError: '',
    hasMessage: '',
    showLoader: false,
  )) {

/*    on<GetPopularMoviesRequestHomeEvent>((event, emit) async {
      try {

        emit(LoadingHomeState());

        PopularMoviesResModel popularMoviesResModel =
        await di<AppRepo>().getAllPopularMovies(
          language: event.language,
          pageNo: event.pageNo
        );

        emit(LoadedHomeState(
          popularMoviesResModel: popularMoviesResModel
        ));
      } catch (e) {
        emit(ErrorHomeState(error: e.toString()));
      }
    });*/

    on<GetPopularMoviesRequestHomeEvent>((event, emit) async {
      try {

        emit(state.copyWith(showLoader: true, hasError: '',
            hasMessage: '',
            popularMoviesResModel: null
        ));


        PopularMoviesResModel popularMoviesResModel =
        await di<AppRepo>().getAllPopularMovies(
          language: event.language,
          pageNo: event.pageNo
        );

        emit(state.copyWith(
          popularMoviesResModel: popularMoviesResModel,
          showLoader: false
        ));
      } catch (e) {
        emit(state.copyWith());
      }
    });
  }
}
