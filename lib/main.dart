import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/config/dependency_injection/di.dart' as serviceLocator;
import 'package:movie_app/config/routes/app_router.dart';
import 'package:movie_app/core/utils/responsive_util.dart';

import 'config/dependency_injection/di.dart';

 main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await dotenv.load(fileName: ".env");
 serviceLocator.setup();
 await di.allReady();
 runApp(MyApp());
   // runApp(MultiBlocProvider(
   //     providers: [
   //       // Blocs which have single instance all over the app
   //       // BlocProvider(
   //       //     create: (context) => GetPopularMoviesBloc()..add(GetPopularMoviesAPIRequestEvent(pageNo: 1, language: 'en-us'))),
   //
   //     ],
   //     child: MyApp()));
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

