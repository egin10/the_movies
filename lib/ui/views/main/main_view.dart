import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/custom_color.dart';
import '../../../utils/ui_helpers.dart';
import '../../widgets/sarchbox.dart';
import 'main_viewmodel.dart';
import 'widgets/header.dart';
import 'widgets/movies.dart';
import 'widgets/persons.dart';
import 'widgets/tv_shows.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = context.watch<MainViewModel>();
    return Scaffold(
      backgroundColor: CustomColor.darkBlueColor,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Column(
            children: [
              Header(viewModel: viewModel),
              const SizedBox(height: 10),
              const SearchBox(),
              const SizedBox(height: 10),
              if (viewModel.menuIndex == 0) const Movies(),
              if (viewModel.menuIndex == 1) const TVShows(),
              if (viewModel.menuIndex == 2) const Persons(),
            ],
          ),
        ),
      ),
    );
  }
}
