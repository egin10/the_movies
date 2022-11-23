import 'package:flutter/material.dart';

import '../../../../models/highlights_model.dart';
import '../../../../utils/navigation.dart';
import '../../tv_shows/airing_today_tv_show/airing_today_tv_show_view.dart';
import '../../tv_shows/on_the_air_tv_show/on_the_air_tv_show_view.dart';
import '../../tv_shows/popular_tv_show/popular_tv_show_view.dart';
import '../../tv_shows/top_rated_tv_show/top_rated_tv_show_view.dart';
import '../main_viewmodel.dart';
import 'highlights_tv_shows.dart';

class TVShows extends StatelessWidget {
  final MainViewModel viewModel;
  const TVShows(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HighlightsTvShows(
          title: 'On The Air TV Shows',
          listData: viewModel.onTheAirTvShows.results != null
              ? viewModel.onTheAirTvShows.results!
                  .map((data) => HighlightsModel(
                        posterPath: data.posterPath,
                        rate: data.voteAverage,
                        id: data.id,
                        title: data.originalName,
                      ))
                  .toList()
              : [],
          navigate: () => navigateTo(
            context,
            MaterialPageRoute(
              builder: (context) => const OnTheAirTvShowView(),
            ),
          ),
        ),
        HighlightsTvShows(
          title: 'Top Rated TV Shows',
          listData: viewModel.topRatedTvShows.results != null
              ? viewModel.topRatedTvShows.results!
                  .map((data) => HighlightsModel(
                        posterPath: data.posterPath,
                        rate: data.voteAverage,
                        id: data.id,
                        title: data.originalName,
                      ))
                  .toList()
              : [],
          navigate: () => navigateTo(
            context,
            MaterialPageRoute(
              builder: (context) => const TopRatedTvShowView(),
            ),
          ),
        ),
        HighlightsTvShows(
          title: 'Airing Today TV Shows',
          listData: viewModel.airingTodayTvShows.results != null
              ? viewModel.airingTodayTvShows.results!
                  .map((data) => HighlightsModel(
                        posterPath: data.posterPath,
                        rate: data.voteAverage,
                        id: data.id,
                        title: data.originalName,
                      ))
                  .toList()
              : [],
          navigate: () => navigateTo(
            context,
            MaterialPageRoute(
              builder: (context) => const AiringTodayTvShowView(),
            ),
          ),
        ),
        HighlightsTvShows(
          title: 'Popular TV Shows',
          listData: viewModel.popularTvShows.results != null
              ? viewModel.popularTvShows.results!
                  .map((data) => HighlightsModel(
                        posterPath: data.posterPath,
                        rate: data.voteAverage,
                        id: data.id,
                        title: data.originalName,
                      ))
                  .toList()
              : [],
          navigate: () => navigateTo(
            context,
            MaterialPageRoute(
              builder: (context) => const PopularTvShowView(),
            ),
          ),
        ),
      ],
    );
  }
}
