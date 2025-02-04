import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/config/dependency_injection/di.dart';
import 'package:movie_app/domain/models/upcoming_movie_res_model.dart';
import 'package:movie_app/domain/repositories/app_repo/app_repo.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc() : super(UpcomingMoviesState(
    hasError: '',
    hasMessage: '',
    showLoader: true,
  )) {
    on<GetUpcomingMoviesApiRequestEvent>((event, emit) async{
      try {
        emit(state.copyWith(showLoader: true ,hasMessage: '',hasError: '',upcomingMovieResModel: null ));
        UpcomingMovieResModel upcomingMovieResModel =
            await di<AppRepo>().getUpcomingMovies(
            language: event.language,
            pageNo: event.pageNo
        );
        emit(state.copyWith(showLoader: false ,upcomingMovieResModel: upcomingMovieResModel));
      } catch (e) {
        emit(state.copyWith(showLoader: false , hasError: e.toString()));
      }
    });
  }
}
