import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/custom_color.dart';
import 'ui/views/main/main_view.dart';
import 'ui/views/main/main_viewmodel.dart';
import 'ui/views/movies/detail_movie/detail_movie_viewmodel.dart';
import 'ui/views/movies/now_playing_movie/now_playing_movie_viewmodel.dart';
import 'ui/views/movies/popular_movie/popular_movie_viewmodel.dart';
import 'ui/views/movies/top_rated_movie/top_rated_movie_viewmodel.dart';
import 'ui/views/movies/upcoming_movie/upcoming_movie_viewmodel.dart';
import 'ui/views/tv_shows/airing_today_tv_show/airing_today_tv_show_viewmodel.dart';
import 'ui/views/tv_shows/on_the_air_tv_show/on_the_air_tv_show_viewmodel.dart';
import 'ui/views/tv_shows/popular_tv_show/popular_tv_show_viewmodel.dart';
import 'ui/views/tv_shows/top_rated_tv_show/top_rated_tv_show_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
        ChangeNotifierProvider(create: (_) => TopRatedMovieViewModel()),
        ChangeNotifierProvider(create: (_) => UpcomingMovieViewModel()),
        ChangeNotifierProvider(create: (_) => NowPlayingMovieViewModel()),
        ChangeNotifierProvider(create: (_) => PopularMovieViewModel()),
        ChangeNotifierProvider(create: (_) => DetailMovieViewModel()),
        ChangeNotifierProvider(create: (_) => PopularTvShowViewModel()),
        ChangeNotifierProvider(create: (_) => OnTheAirTvShowViewModel()),
        ChangeNotifierProvider(create: (_) => TopRatedTvShowViewModel()),
        ChangeNotifierProvider(create: (_) => AiringTodayTvShowViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Movies',
        theme: ThemeData(
          primaryColor: CustomColor.redColor,
          appBarTheme: AppBarTheme(
            backgroundColor: CustomColor.darkBlueColor,
          ),
        ),
        home: const MainView(),
        // home: FutureBuilder(
        //   future: Future.delayed(
        //     const Duration(seconds: 3),
        //   ),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       return const MainView();
        //     }
        //     return const SplashScreenView();
        //   },
        // ),
      ),
    );
  }
}
