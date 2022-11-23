import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/custom_color.dart';
import '../../../../utils/ui_helpers.dart';
import '../main_viewmodel.dart';

class Header extends StatelessWidget {
  final MainViewModel viewModel;
  const Header({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      height: 50,
      width: screenWidth(context),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
              'assets/logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: viewModel.menus
                  .asMap()
                  .entries
                  .map(
                    (entry) => _buildMenuItem(
                      title: entry.value,
                      onPressed: () => viewModel.setMenuIndex(
                        entry.key,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Container _buildMenuItem(
      {required String title, required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: CustomColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
