import 'package:flutter/material.dart';

import '../../constants/custom_color.dart';

class CustomLoader extends StatelessWidget {
  final double? size;
  const CustomLoader({Key? key, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: CustomColor.redColor,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
