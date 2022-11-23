import 'package:flutter/material.dart';

import '../../../../models/highlights_model.dart';
import '../../../../utils/navigation.dart';
import '../../movies/now_playing_movie/now_playing_movie_view.dart';
import '../../movies/popular_movie/popular_movie_view.dart';
import '../../movies/top_rated_movie/top_rated_movie_view.dart';
import '../../movies/upcoming_movie/upcoming_movie_view.dart';
import '../main_viewmodel.dart';
import 'highlights_section.dart';

class Movies extends StatelessWidget {
  final MainViewModel viewModel;
  const Movies(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          HighlightsSection(
            title: 'Popular Movies',
            listData: viewModel.popularMovies.results != null
                ? viewModel.popularMovies.results!
                    .map((data) => HighlightsModel(
                          posterPath: data.posterPath,
                          rate: data.voteAverage,
                          id: data.id,
                          title: data.title,
                        ))
                    .toList()
                : [],
            navigate: () => navigateTo(
              context,
              MaterialPageRoute(
                builder: (context) => const PopularMovieView(),
              ),
            ),
          ),
          HighlightsSection(
            title: 'Now Playing Movies',
            listData: viewModel.nowPlayingMovies.results != null
                ? viewModel.nowPlayingMovies.results!
                    .map((data) => HighlightsModel(
                          posterPath: data.posterPath,
                          rate: data.voteAverage,
                          id: data.id,
                          title: data.title,
                        ))
                    .toList()
                : [],
            navigate: () => navigateTo(
              context,
              MaterialPageRoute(
                builder: (context) => const NowPlayingMovieView(),
              ),
            ),
          ),
          HighlightsSection(
            title: 'Top Rated Movies',
            listData: viewModel.topRatedMovies.results != null
                ? viewModel.topRatedMovies.results!
                    .map((data) => HighlightsModel(
                          posterPath: data.posterPath,
                          rate: data.voteAverage,
                          id: data.id,
                          title: data.title,
                        ))
                    .toList()
                : [],
            navigate: () => navigateTo(
              context,
              MaterialPageRoute(
                builder: (context) => const TopRatedMovieView(),
              ),
            ),
          ),
          HighlightsSection(
            title: 'Upcoming Movies',
            listData: viewModel.upcomingMovies.results != null
                ? viewModel.upcomingMovies.results!
                    .map((data) => HighlightsModel(
                          posterPath: data.posterPath,
                          rate: data.voteAverage,
                          id: data.id,
                          title: data.title,
                        ))
                    .toList()
                : [],
            navigate: () => navigateTo(
              context,
              MaterialPageRoute(
                builder: (context) => const UpcomingMovieView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
