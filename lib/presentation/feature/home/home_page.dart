import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/debug_logger.dart';
import 'package:movie_app/data/data_utility/api_end_points.dart';
import 'package:movie_app/domain/models/movie_res_model.dart';
import 'package:movie_app/presentation/common_widgets/common_widgets.dart';
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
    debuggerAdvance(tag: "", value: "homepage initState");
  }

  @override
  Widget build(BuildContext context) {
    debuggerAdvance(tag: "", value: "build method render");
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: AppStrings.movieu,
          hasArrow: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<GetPopularMoviesBloc, GetPopularMoviesState>(
                  bloc: GetPopularMoviesBloc()
                    ..add(GetPopularMoviesAPIRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, GetPopularMoviesState state) {
                    return _ViewWrapper(
                      showLoader: state.showLoader,
                      headingText: AppStrings.popularMovies,
                      listOfResult: state.movieResModel?.results ?? [],
                    );
                  }),
              BlocBuilder(
                  bloc: TopRatedMovieBloc()
                    ..add(GetTopRatedMoviesApiRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, TopRatedState state) {
                    return _ViewWrapper(
                      showLoader: state.showLoader,
                      headingText: AppStrings.topRatedMovies,
                      listOfResult: state.movieResModel?.results ?? [],
                    );
                  }),
              BlocBuilder(
                  bloc: UpcomingMoviesBloc()
                    ..add(GetUpcomingMoviesApiRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, UpcomingMoviesState state) {
                    return _ViewWrapper(
                      showLoader: state.showLoader,
                      headingText: AppStrings.upcomingMovies,
                      listOfResult: state.movieResModel?.results ?? [],
                    );
                  }),
              BlocBuilder(
                  bloc: NowPlayingBloc()
                    ..add(GetNowPlayingApiRequestEvent(
                        pageNo: 1, language: 'en-us')),
                  builder: (context, NowPlayingState state) {
                    return _ViewWrapper(
                      showLoader: state.showLoader,
                      headingText: AppStrings.nowPlayingMovies,
                      listOfResult: state.movieResModel?.results ?? [],
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
          NetworkCacheImage(
            imageUrl: imagePath,
            height: 150,
            boxFit: BoxFit.fill,
            width: 150,
            errorWidget: (context, string, _) {
              return Icon(
                Icons.image,
                size: 150,
                color: Colors.grey,
              );
            },
            placeholder: (context, value) {
              return Icon(
                Icons.image,
                size: 150,
                color: Colors.grey,
              );
            },
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
  final bool showLoader;
  final String headingText;
  final List<Result> listOfResult;

  const _ViewWrapper(
      {super.key,
      required this.headingText,
      required this.showLoader,
      required this.listOfResult});

  @override
  Widget build(BuildContext context) {
    if (showLoader) {
      return SizedBox(
        height: 40,
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (listOfResult.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            title: headingText,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            margin: EdgeInsets.only(top: 20, left: 20),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listOfResult.length,
                itemBuilder: (context, index) {
                  Result model = listOfResult[index];
                  return _CardView(
                    title: model.title ?? '',
                    imagePath:
                        ApiEndPoints.imageURL + (model.backdropPath ?? ''),
                  );
                }),
          ),
        ],
      );
    }
  }
}
