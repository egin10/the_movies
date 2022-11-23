import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/custom_color.dart';
import '../../../../models/highlights_model.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/card_poster_image.dart';
import '../../movies/detail_movie/detail_movie_view.dart';

class HighlightsTvShows extends StatelessWidget {
  final String title;
  final VoidCallback? navigate;
  final List<HighlightsModel>? listData;
  const HighlightsTvShows(
      {Key? key, required this.title, this.navigate, this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
      width: screenWidth(context),
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: navigate,
            child: Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CustomColor.whiteColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: listData != null
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: listData!
                        .map(
                          (data) => CardPosterImage(
                            posterPath: '${data.posterPath}',
                            width: 100,
                            rate: data.rate,
                            // onTap: () => navigateTo(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailMovieView(
                            //       id: '${data.id}',
                            //       title: data.title ?? '',
                            //     ),
                            //   ),
                            // ),
                          ),
                        )
                        .toList(),
                  )
                : Center(
                    child: Text(
                      'Empty',
                      style: GoogleFonts.lato(
                          color: CustomColor.whiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
