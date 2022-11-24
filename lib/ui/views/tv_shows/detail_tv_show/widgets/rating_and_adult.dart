import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/custom_color.dart';

class RatingAndAdult extends StatelessWidget {
  final double rating;
  final bool isAdult;
  const RatingAndAdult({Key? key, required this.rating, required this.isAdult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Adult
        isAdult
            ? Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: CustomColor.redColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Text(
                      '18+',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: CustomColor.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        const SizedBox(width: 5),
        // Rating
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: CustomColor.redColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text(
                rating.toStringAsFixed(1),
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: CustomColor.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                rating == 0
                    ? Icons.star_border_rounded
                    : (rating > 0 && rating < 10
                        ? Icons.star_half_rounded
                        : Icons.star_rate_rounded),
                color: Colors.amber,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
