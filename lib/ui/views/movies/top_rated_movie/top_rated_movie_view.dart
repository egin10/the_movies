import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_color.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/card_poster_image.dart';
import '../../../widgets/custom_loader.dart';
import '../../detail_movie/detail_movie_view.dart';
import 'top_rated_movie_viewmodel.dart';

class TopRatedMovieView extends StatelessWidget {
  const TopRatedMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopRatedMovieViewModel viewModel = context.watch<TopRatedMovieViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Top Rated Movies',
          style: GoogleFonts.lato(),
        ),
      ),
      backgroundColor: CustomColor.darkBlueColor,
      body: viewModel.loading
          ? const CustomLoader()
          : Container(
              width: screenWidth(context),
              height: screenHeight(context),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 0.7,
                children: viewModel.topRatedMovies.results != null
                    ? viewModel.topRatedMovies.results!
                        .map((data) => CardPosterImage(
                              posterPath: '${data.posterPath}',
                              rate: data.voteAverage ?? 0,
                              onTap: () => navigateTo(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailMovieView(
                                    id: '${data.id}',
                                    title: data.title ?? '',
                                  ),
                                ),
                              ),
                            ))
                        .toList()
                    : [],
              ),
            ),
    );
  }
}
