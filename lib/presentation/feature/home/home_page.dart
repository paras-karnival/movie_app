import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/debug_logger.dart';
import 'package:movie_app/data/data_utility/api_end_points.dart';
import 'package:movie_app/domain/models/now_playing_movie_res_model.dart'
    as now_playing;
import 'package:movie_app/domain/models/popular_movies_res_model.dart'
    as popular;
import 'package:movie_app/domain/models/top_rated_movie_res_model.dart'
    as top_rated;
import 'package:movie_app/domain/models/upcoming_movie_res_model.dart'
    as upcoming;
import 'package:movie_app/presentation/common_widgets/common_widgets.dart';
import 'package:movie_app/presentation/common_widgets/text_view.dart';
import 'package:movie_app/presentation/feature/home/controller/get_popular_movies/get_popular_movies_bloc.dart';
import 'package:movie_app/presentation/feature/home/controller/now_playing/now_playing_movie_bloc.dart';

import 'controller/top_rated/top_rated_movie_bloc.dart';
import 'controller/upcoming/upcoming_movies_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // context.read<GetPopularMoviesBloc>().add(GetPopularMoviesAPIRequestEvent(pageNo: 1, language: 'en-us'));
    // });

    // BlocProvider(
    //     create: (context) => TopRatedMovieBloc()
    //       ..add(GetTopRatedMoviesApiRequestEvent(
    //           pageNo: 1, language: 'en-us'))),
    // BlocProvider(
    //     create: (context) => UpcomingMoviesBloc()
    //       ..add(GetUpcomingMoviesApiRequestEvent(
    //           pageNo: 1, language: 'en-us'))),
    // BlocProvider(
    //     create: (context) => NowPlayingBloc()
    //       ..add(
    //           GetNowPlayingApiRequestEvent(pageNo: 1, language: 'en-us'))),
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(title: AppStrings.movieu,
        hasArrow: false,),

        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder(
                  bloc: GetPopularMoviesBloc()
                    ..add(GetPopularMoviesAPIRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, GetPopularMoviesState state) {
                    return _ViewWrapper(
                      listLength:
                          state.popularMoviesResModel?.results?.length ?? 0,
                      headingText: AppStrings.popularMovies,
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.popularMoviesResModel?.results?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              popular.Movie model =
                                  state.popularMoviesResModel!.results![index];
                              return _CardView(
                                title: model.title ?? '',
                                imagePath: ApiEndPoints.imageURL +
                                    (model.posterPath ?? ''),
                              );
                            }),
                      ),
                    );
                  }),
              BlocBuilder(
                  bloc: TopRatedMovieBloc()
                    ..add(GetTopRatedMoviesApiRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, TopRatedState state) {
                    return _ViewWrapper(
                      listLength:
                          state.topRatedMovieResModel?.results?.length ?? 0,
                      headingText: AppStrings.topRatedMovies,
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.topRatedMovieResModel?.results?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              top_rated.Result model =
                                  state.topRatedMovieResModel!.results![index];
                              return _CardView(
                                title: model.title ?? '',
                                imagePath: ApiEndPoints.imageURL +
                                    (model.posterPath ?? ''),
                              );
                            }),
                      ),
                    );
                  }),
              BlocBuilder(
                  bloc: UpcomingMoviesBloc()
                    ..add(GetUpcomingMoviesApiRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, UpcomingMoviesState state) {
                    return _ViewWrapper(
                      listLength:
                          state.upcomingMovieResModel?.results?.length ?? 0,
                      headingText: AppStrings.upcomingMovies,
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.upcomingMovieResModel?.results?.length ??
                                    0,
                            itemBuilder: (context, index) {
                              upcoming.Result model =
                                  state.upcomingMovieResModel!.results![index];
                              return _CardView(
                                title: model.title ?? '',
                                imagePath: ApiEndPoints.imageURL +
                                    (model.posterPath ?? ''),
                              );
                            }),
                      ),
                    );
                  }),
              BlocBuilder(
                  bloc: NowPlayingBloc()
                    ..add(GetNowPlayingApiRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, NowPlayingState state) {
                    return _ViewWrapper(
                      listLength:
                          state.nowPlayingMovieResModel?.results?.length ?? 0,
                      headingText: AppStrings.nowPlayingMovies,
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state
                                    .nowPlayingMovieResModel?.results?.length ??
                                0,
                            itemBuilder: (context, index) {
                              now_playing.Movie model = state
                                  .nowPlayingMovieResModel!.results![index];
                              return _CardView(
                                title: model.title ?? '',
                                imagePath: ApiEndPoints.imageURL +
                                    (model.posterPath ?? ''),
                              );
                            }),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardView extends StatelessWidget {
  final String imagePath;
  final String title;

  const _CardView({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            imagePath,
            height: 150,
            fit: BoxFit.fill,
            width: 150,
          ),
          TextView(
            title: title,
            width: 150,
            maxLine: 2,
            overflow: TextOverflow.ellipsis,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          )
        ],
      ),
    );
  }
}

class _ViewWrapper extends StatelessWidget {
  final int listLength;
  final String headingText;
  final Widget child;

  const _ViewWrapper(
      {super.key,
      required this.headingText,
      required this.child,
      required this.listLength});

  @override
  Widget build(BuildContext context) {
    if (listLength == 0) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          title: headingText,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          margin: EdgeInsets.only(top: 20,left: 20),
        ),
        child
      ],
    );
  }
}
