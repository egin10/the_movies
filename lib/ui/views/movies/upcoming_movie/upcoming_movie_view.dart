import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_color.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/card_poster_image.dart';
import 'upcoming_movie_viewmodel.dart';

class UpcomingMovieView extends StatelessWidget {
  const UpcomingMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpcomingMovieViewModel viewModel = context.watch<UpcomingMovieViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Upcoming Movies'),
      ),
      backgroundColor: CustomColor.darkBlueColor,
      body: viewModel.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: screenWidth(context),
              height: screenHeight(context),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 0.7,
                children: viewModel.topRatedMovies.results != null
                    ? viewModel.topRatedMovies.results!
                        .map((data) =>
                            CardPosterImage(posterPath: '${data.posterPath}'))
                        .toList()
                    : [],
              ),
            ),
    );
  }
}
