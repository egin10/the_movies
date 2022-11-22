import 'package:flutter/material.dart';
import '../../constants/endpoint.dart';

class CardPosterImage extends StatelessWidget {
  final String posterPath;

  const CardPosterImage({Key? key, required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: NetworkImage('${Endpoint.imageOriginUri}/$posterPath'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
