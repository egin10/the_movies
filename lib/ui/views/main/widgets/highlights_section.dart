import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/custom_color.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/card_poster_image.dart';

class HighlightsSection extends StatelessWidget {
  final String title;
  final VoidCallback? navigateTo;
  const HighlightsSection({Key? key, required this.title, this.navigateTo})
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whiteColor,
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: navigateTo,
              //   child: Text(
              //     'view more',
              //     style: GoogleFonts.lato(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w400,
              //       color: CustomColor.whiteColor,
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 5; i++)
                  const CardPosterImage(
                    posterPath: '/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
