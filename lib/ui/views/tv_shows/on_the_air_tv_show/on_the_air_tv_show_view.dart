import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_color.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/card_poster_image.dart';
import '../../../widgets/custom_loader.dart';
import '../detail_tv_show/detail_tv_show_view.dart';
import 'on_the_air_tv_show_viewmodel.dart';

class OnTheAirTvShowView extends StatelessWidget {
  const OnTheAirTvShowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnTheAirTvShowViewModel viewModel =
        context.watch<OnTheAirTvShowViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'On The Air TV Shows',
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
                children: viewModel.onTheAirTvShows.results != null
                    ? viewModel.onTheAirTvShows.results!
                        .map((data) => CardPosterImage(
                              posterPath: '${data.posterPath}',
                              rate: data.voteAverage ?? 0,
                              onTap: () => navigateTo(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailTvShowView(
                                    id: '${data.id}',
                                    title: data.originalName ?? '',
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
