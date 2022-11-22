import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/custom_color.dart';
import '../../../utils/ui_helpers.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.redColor,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: screenWidth(context) / 3.5,
                width: screenWidth(context) / 3.5,
                child: LottieBuilder.asset(
                  'assets/splash_icon.json',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'The Movies',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
