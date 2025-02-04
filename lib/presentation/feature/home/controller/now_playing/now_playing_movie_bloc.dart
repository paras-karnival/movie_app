import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/config/dependency_injection/di.dart';
import 'package:movie_app/domain/models/now_playing_movie_res_model.dart';
import 'package:movie_app/domain/repositories/app_repo/app_repo.dart';



part 'now_playing_movie_event.dart';
part 'now_playing_movie_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingState(
    hasError: '',
    hasMessage: '',
    showLoader: true,
  )) {
    on<GetNowPlayingApiRequestEvent>((event, emit) async {
      try {
        emit(state.copyWith(showLoader: true ,hasMessage: '',hasError: '', nowPlayingMovieResModel: null));
        NowPlayingMovieResModel nowPlayingMovieResModel =
        await di<AppRepo>().getNowPlayingMovies(
            language: event.language,
            pageNo: event.pageNo
        );
        emit(state.copyWith(showLoader: false ,nowPlayingMovieResModel: nowPlayingMovieResModel));
      } catch (e) {
        emit(state.copyWith(showLoader: false , hasError: e.toString()));
      }
    });
  }
}
