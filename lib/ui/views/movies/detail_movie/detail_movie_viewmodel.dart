import 'package:flutter/material.dart';

import '../../../../models/movies/detail_movie_model.dart';
import '../../../../repository/movies/detail_movie_repository.dart';

class DetailMovieViewModel extends ChangeNotifier {
  DetailMovieModel? _detailMovie;

  DetailMovieModel get detailMovie => _detailMovie ?? DetailMovieModel();

  setDetailMovie(DetailMovieModel? value) {
    _detailMovie = value;
  }

  Future<void> getDetailMovie(String id) async {
    final response = await DetailMovieRepository.getDetailMovie(id);
    response.fold(
      (err) => null,
      (res) {
        setDetailMovie(res);
      },
    );
  }
}
