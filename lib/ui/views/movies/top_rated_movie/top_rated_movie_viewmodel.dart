import 'package:flutter/material.dart';

import '../../../../models/movies/top_rated_movie_model.dart';
import '../../../../repository/movies/top_rated_movie_repository.dart';

class TopRatedMovieViewModel extends ChangeNotifier {
  bool _loading = false;
  TopRatedMovieModel? _topRatedMovies;

  bool get loading => _loading;
  TopRatedMovieModel get topRatedMovies =>
      _topRatedMovies ?? TopRatedMovieModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setTopRatedMovies(TopRatedMovieModel? value) {
    _topRatedMovies = value;
  }

  TopRatedMovieViewModel() {
    getTopRatedMovies();
  }

  getTopRatedMovies() async {
    setLoading(true);

    final response = await TopRatedMovieRepository.getTopRatedMovies();
    response.fold(
      (err) => null,
      (res) {
        setTopRatedMovies(res);
      },
    );

    setLoading(false);
  }
}
