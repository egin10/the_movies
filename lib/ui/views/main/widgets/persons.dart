import 'package:flutter/material.dart';

import 'highlights_section.dart';

class Persons extends StatelessWidget {
  const Persons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          HighlightsSection(
            title: 'Popular People',
            navigateTo: () {
              print('Navigate to Popular Page');
            },
          ),
        ],
      ),
    );
  }
}
