import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/config/dependency_injection/di.dart';
import 'package:movie_app/domain/models/movie_res_model.dart';
import 'package:movie_app/domain/repositories/app_repo/app_repo.dart';

part 'get_popular_movies_event.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesBloc
    extends Bloc<GetPopularMoviesEvent, GetPopularMoviesState> {
  GetPopularMoviesBloc()
      : super(GetPopularMoviesState(
            showLoader: true,
            hasMessage: '',
            hasError: '',
            movieResModel: null)) {
    on<GetPopularMoviesAPIRequestEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            showLoader: true,
            hasMessage: '',
            hasError: '',
            movieResModel: null));

        await Future.delayed(Duration(seconds: 3));
        MovieResModel popularMoviesResModel = await di<AppRepo>()
            .getAllPopularMovies(
                language: event.language, pageNo: event.pageNo);
        emit(state.copyWith(
            showLoader: false, movieResModel: popularMoviesResModel));
      } catch (e) {
        emit(state.copyWith(showLoader: false, hasError: e.toString()));
      }
    });
  }
}
