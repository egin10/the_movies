import 'package:flutter/material.dart';

import '../main_viewmodel.dart';
import 'highlights_section.dart';

class Persons extends StatelessWidget {
  final MainViewModel viewModel;
  const Persons(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          HighlightsSection(
            title: 'Popular People',
            navigate: () {
              print('Navigate to Popular Page');
            },
          ),
        ],
      ),
    );
  }
}
