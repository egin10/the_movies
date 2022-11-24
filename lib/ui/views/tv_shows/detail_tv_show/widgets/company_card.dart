import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/custom_color.dart';

class CompanyCard extends StatelessWidget {
  final String name;
  final String country;
  final String? logoPath;
  const CompanyCard(
      {Key? key,
      required this.name,
      required this.country,
      required this.logoPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.whiteColor, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: GoogleFonts.lato(
              color: CustomColor.whiteColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
