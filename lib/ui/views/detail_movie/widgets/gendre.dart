import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/custom_color.dart';

class GendreCard extends StatelessWidget {
  final String name;
  const GendreCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColor.redColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.lato(
            color: CustomColor.whiteColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
