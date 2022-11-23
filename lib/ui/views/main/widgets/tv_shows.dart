import 'package:flutter/material.dart';

import '../main_viewmodel.dart';
import 'highlights_section.dart';

class TVShows extends StatelessWidget {
  final MainViewModel viewModel;
  const TVShows(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          HighlightsSection(
            title: 'The On Air TV Shows',
            navigate: () {
              print('Navigate to Now Playing Page');
            },
          ),
          HighlightsSection(
            title: 'Top Rated TV Shows',
            navigate: () {
              print('Navigate to Top Rated Page');
            },
          ),
          HighlightsSection(
            title: 'Airing Today TV Shows',
            navigate: () {
              print('Navigate to Upcoming Page');
            },
          ),
          HighlightsSection(
            title: 'Popular TV Shows',
            navigate: () {
              print('Navigate to Popular Page');
            },
          ),
        ],
      ),
    );
  }
}
