import 'package:flutter/material.dart';

import 'highlights_section.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          HighlightsSection(
            title: 'Now Playing Movies',
            navigateTo: () {
              print('Navigate to Now Playing Page');
            },
          ),
          HighlightsSection(
            title: 'Top Rated Movies',
            navigateTo: () {
              print('Navigate to Top Rated Page');
            },
          ),
          HighlightsSection(
            title: 'Upcoming Movies',
            navigateTo: () {
              print('Navigate to Upcoming Page');
            },
          ),
          HighlightsSection(
            title: 'Popular Movies',
            navigateTo: () {
              print('Navigate to Popular Page');
            },
          ),
        ],
      ),
    );
  }
}
