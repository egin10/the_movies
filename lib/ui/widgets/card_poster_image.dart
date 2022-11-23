import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/custom_color.dart';
import '../../constants/endpoint.dart';

class CardPosterImage extends StatelessWidget {
  final String posterPath;
  final double? rate;
  final double? width;
  final VoidCallback? onTap;

  const CardPosterImage(
      {Key? key,
      required this.posterPath,
      this.rate = 0,
      this.width,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  '${Endpoint.imageOriginUri}/$posterPath',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: CustomColor.redColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$rate',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: CustomColor.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        rate! == 0
                            ? Icons.star_border_rounded
                            : (rate! > 0 && rate! < 10
                                ? Icons.star_half_rounded
                                : Icons.star_rate_rounded),
                        color: Colors.amber,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
