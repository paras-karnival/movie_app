import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/dependency_injection/di.dart' as serviceLocator;
import 'package:movie_app/config/routes/app_router.dart';
import 'package:movie_app/core/utils/responsive_util.dart';
import 'package:movie_app/presentation/feature/auth/controller/login_bloc.dart';
import 'package:movie_app/presentation/feature/home/controller/get_popular_movies/get_popular_movies_bloc.dart';
import 'package:movie_app/presentation/feature/home/controller/home_bloc.dart';

import 'config/dependency_injection/di.dart';

 main() async{
 WidgetsFlutterBinding.ensureInitialized();
 serviceLocator.setup();
 await di.allReady();
   runApp(MultiBlocProvider(
       providers: [
         // Blocs which have single instance all over the app
         // BlocProvider(
         //     create: (context) => GetPopularMoviesBloc()..add(GetPopularMoviesAPIRequestEvent(pageNo: 1, language: 'en-us'))),
         BlocProvider(create: (_) => LoginBloc()),
       ],
       child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Responsive.size = MediaQuery.sizeOf(context);
    return MaterialApp.router(
      routerConfig: AppRouter.routers,
      title: 'Movie app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),

    );
  }
}

