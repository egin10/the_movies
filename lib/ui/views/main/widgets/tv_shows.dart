import 'package:flutter/material.dart';

import 'highlights_section.dart';

class TVShows extends StatelessWidget {
  const TVShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          HighlightsSection(
            title: 'The On Air TV Shows',
            navigateTo: () {
              print('Navigate to Now Playing Page');
            },
          ),
          HighlightsSection(
            title: 'Top Rated TV Shows',
            navigateTo: () {
              print('Navigate to Top Rated Page');
            },
          ),
          HighlightsSection(
            title: 'Airing Today TV Shows',
            navigateTo: () {
              print('Navigate to Upcoming Page');
            },
          ),
          HighlightsSection(
            title: 'Popular TV Shows',
            navigateTo: () {
              print('Navigate to Popular Page');
            },
          ),
        ],
      ),
    );
  }
}
