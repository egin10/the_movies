import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_color.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/card_poster_image.dart';
import '../../../widgets/custom_loader.dart';
import '../detail_tv_show/detail_tv_show_view.dart';
import 'airing_today_tv_show_viewmodel.dart';

class AiringTodayTvShowView extends StatelessWidget {
  const AiringTodayTvShowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AiringTodayTvShowViewModel viewModel =
        context.watch<AiringTodayTvShowViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Airing Today TV Shows',
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
                children: viewModel.airingTodayTvShows.results != null
                    ? viewModel.airingTodayTvShows.results!
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
