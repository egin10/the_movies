import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/custom_color.dart';
import '../../../utils/ui_helpers.dart';
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
          child: ListView(
            children: [
              Header(viewModel: viewModel),
              const SizedBox(height: 20),
              SizedBox(
                width: screenWidth(context),
                height: screenHeight(context),
                child: PageView(
                  controller: viewModel.pageController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Movies(viewModel),
                    TVShows(viewModel),
                    Persons(viewModel)
                  ],
                  onPageChanged: (index) {
                    viewModel.setMenuIndex(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
