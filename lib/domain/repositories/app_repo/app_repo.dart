

import 'package:movie_app/domain/models/now_playing_movie_res_model.dart';
import 'package:movie_app/domain/models/popular_movies_res_model.dart';
import 'package:movie_app/domain/models/top_rated_movie_res_model.dart';
import 'package:movie_app/domain/models/upcoming_movie_res_model.dart';

abstract class AppRepo {
  Future<PopularMoviesResModel> getAllPopularMovies({required int pageNo , required String language});
  Future<TopRatedMovieResModel> getTopRatedMovies({required int pageNo , required String language});
  Future<NowPlayingMovieResModel> getNowPlayingMovies({required int pageNo , required String language});
  Future<UpcomingMovieResModel> getUpcomingMovies({required int pageNo , required String language});
}
