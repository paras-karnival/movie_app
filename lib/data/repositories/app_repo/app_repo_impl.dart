import 'package:dio/dio.dart' as dio;
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/data/data_utility/api_end_points.dart';
import 'package:movie_app/data/data_utility/exception_handler.dart';
import 'package:movie_app/data/rest_client/dio_base.dart';
import 'package:movie_app/domain/models/now_playing_movie_res_model.dart';
import 'package:movie_app/domain/models/popular_movies_res_model.dart';
import 'package:movie_app/domain/models/top_rated_movie_res_model.dart';
import 'package:movie_app/domain/models/upcoming_movie_res_model.dart';
import 'package:movie_app/domain/repositories/app_repo/app_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppRepoImpl implements AppRepo {
   dio.Dio dioInst;

  AppRepoImpl({required this.dioInst});

  Map<String, String> getHTTPHeader() {
    return {
      "Authorization": 'Bearer ${AppStrings.tmdbikey}',
      'Content-type': 'application/json',
    };
  }

  @override
  Future<PopularMoviesResModel> getAllPopularMovies({required int pageNo , required String language}) async {

   dioInst.options.headers = getHTTPHeader();
    dio.BaseOptions options = dioInst.options;
    dioInst.options = options;
    try {
      var response = await DioClient(dioInst).get(
          url: ApiEndPoints.popularMovies,
          uniqueKey: "getAllPopularMovies",
        queryParameters: 
          {
            'language' : language,
            'page':pageNo
          }
      );
      return PopularMoviesResModel.fromJson(response.data);
    } on dio.DioException catch (e) {
      throw DioExceptions.fromDioError(dioError: e, errorFrom: "getAllPopularMovies")
          .errorMessage();
      // if you want to customize the error message
      //  int statusCode =  DioExceptions.fromDioError(dioError: e, errorFrom: "login").errorStatusCode();
      //  if(statusCode == 400)
      //  {
      //    throw "Incorrect Email Password";
      //  }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NowPlayingMovieResModel> getNowPlayingMovies({required int pageNo, required String language}) async {

    dioInst.options.headers = getHTTPHeader();
    dio.BaseOptions options = dioInst.options;
    dioInst.options = options;
    try {
      var response = await DioClient(dioInst).get(
          url: ApiEndPoints.popularMovies,
          uniqueKey: "getNowPlayingMovies",
          queryParameters:
          {
            'language' : language,
            'page':pageNo
          }
      );
      return NowPlayingMovieResModel.fromJson(response.data);
    } on dio.DioException catch (e) {
      throw DioExceptions.fromDioError(dioError: e, errorFrom: "getNowPlayingMovies")
          .errorMessage();
      // if you want to customize the error message
      //  int statusCode =  DioExceptions.fromDioError(dioError: e, errorFrom: "login").errorStatusCode();
      //  if(statusCode == 400)
      //  {
      //    throw "Incorrect Email Password";
      //  }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TopRatedMovieResModel> getTopRatedMovies({required int pageNo, required String language}) async {

    dioInst.options.headers = getHTTPHeader();
    dio.BaseOptions options = dioInst.options;
    dioInst.options = options;
    try {
      var response = await DioClient(dioInst).get(
          url: ApiEndPoints.topRatedMovies,
          uniqueKey: "getTopRatedMovies",
          queryParameters:
          {
            'language' : language,
            'page':pageNo
          }
      );
      return TopRatedMovieResModel.fromJson(response.data);
    } on dio.DioException catch (e) {
      throw DioExceptions.fromDioError(dioError: e, errorFrom: "getTopRatedMovies")
          .errorMessage();
      // if you want to customize the error message
      //  int statusCode =  DioExceptions.fromDioError(dioError: e, errorFrom: "login").errorStatusCode();
      //  if(statusCode == 400)
      //  {
      //    throw "Incorrect Email Password";
      //  }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpcomingMovieResModel> getUpcomingMovies({required int pageNo, required String language}) async {

    dioInst.options.headers = getHTTPHeader();
    dio.BaseOptions options = dioInst.options;
    dioInst.options = options;
    try {

      // 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'
      var response = await DioClient(dioInst).get(
          url: ApiEndPoints.upcomingMovies,
          uniqueKey: "getUpcomingMovies",
          queryParameters:
          {
            'language' : language,
            'page':pageNo
          }
      );
      return UpcomingMovieResModel.fromJson(response.data);
    } on dio.DioException catch (e) {
      throw DioExceptions.fromDioError(dioError: e, errorFrom: "getUpcomingMovies")
          .errorMessage();
      // if you want to customize the error message
      //  int statusCode =  DioExceptions.fromDioError(dioError: e, errorFrom: "login").errorStatusCode();
      //  if(statusCode == 400)
      //  {
      //    throw "Incorrect Email Password";
      //  }
    } catch (e) {
      rethrow;
    }
  }

}
