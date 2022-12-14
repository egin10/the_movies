import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'constants/custom_color.dart';
import 'ui/views/main/main_view.dart';
import 'ui/views/main/main_viewmodel.dart';
import 'ui/views/movies/detail_movie/detail_movie_viewmodel.dart';
import 'ui/views/movies/now_playing_movie/now_playing_movie_viewmodel.dart';
import 'ui/views/movies/popular_movie/popular_movie_viewmodel.dart';
import 'ui/views/movies/top_rated_movie/top_rated_movie_viewmodel.dart';
import 'ui/views/movies/upcoming_movie/upcoming_movie_viewmodel.dart';
import 'ui/views/splash_screen/splash_screen_view.dart';
import 'ui/views/tv_shows/airing_today_tv_show/airing_today_tv_show_viewmodel.dart';
import 'ui/views/tv_shows/detail_tv_show/detail_tv_show_viewmodel.dart';
import 'ui/views/tv_shows/on_the_air_tv_show/on_the_air_tv_show_viewmodel.dart';
import 'ui/views/tv_shows/popular_tv_show/popular_tv_show_viewmodel.dart';
import 'ui/views/tv_shows/top_rated_tv_show/top_rated_tv_show_viewmodel.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://8fdea51564ad42f2b20b3840fcc51166@o1213255.ingest.sentry.io/4504246186672128';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DetailMovieViewModel()),
        ChangeNotifierProvider(create: (_) => MainViewModel()),
        ChangeNotifierProvider(create: (_) => NowPlayingMovieViewModel()),
        ChangeNotifierProvider(create: (_) => PopularMovieViewModel()),
        ChangeNotifierProvider(create: (_) => TopRatedMovieViewModel()),
        ChangeNotifierProvider(create: (_) => UpcomingMovieViewModel()),
        ChangeNotifierProvider(create: (_) => AiringTodayTvShowViewModel()),
        ChangeNotifierProvider(create: (_) => DetailTvShowViewModel()),
        ChangeNotifierProvider(create: (_) => OnTheAirTvShowViewModel()),
        ChangeNotifierProvider(create: (_) => PopularTvShowViewModel()),
        ChangeNotifierProvider(create: (_) => TopRatedTvShowViewModel()),
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
        home: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 3),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const MainView();
            }
            return const SplashScreenView();
          },
        ),
      ),
    );
  }
}
