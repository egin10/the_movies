import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_color.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/card_poster_image.dart';
import 'top_rated_movie_viewmodel.dart';

class TopRatedMovieView extends StatelessWidget {
  const TopRatedMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopRatedMovieViewModel viewModel = context.watch<TopRatedMovieViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Top Rated Movies'),
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
