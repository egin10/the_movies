import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/custom_color.dart';
import '../../../../../constants/endpoint.dart';

class TvShowCard extends StatelessWidget {
  final String name;
  final String? logoPath;
  const TvShowCard({Key? key, required this.name, required this.logoPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logoPath != null
              ? SizedBox(
                  child: CachedNetworkImage(
                      imageUrl: '${Endpoint.imageW500Uri}/$logoPath'),
                )
              : Container(),
          Text(
            name,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
