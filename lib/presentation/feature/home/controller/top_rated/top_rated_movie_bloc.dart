import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/config/dependency_injection/di.dart';
import 'package:movie_app/domain/models/movie_res_model.dart';
import 'package:movie_app/domain/repositories/app_repo/app_repo.dart';

part 'top_rated_movie_event.dart';

part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedMovieBloc()
      : super(TopRatedState(
          hasError: '',
          hasMessage: '',
          showLoader: true,
        )) {
    on<GetTopRatedMoviesApiRequestEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            showLoader: true,
            hasMessage: '',
            hasError: '',
            movieResModel: null));
        MovieResModel topRatedMovieResModel = await di<AppRepo>()
            .getTopRatedMovies(language: event.language, pageNo: event.pageNo);
        emit(state.copyWith(
            showLoader: false, movieResModel: topRatedMovieResModel));
      } catch (e) {
        emit(state.copyWith(showLoader: false, hasError: e.toString()));
      }
    });
  }
}
