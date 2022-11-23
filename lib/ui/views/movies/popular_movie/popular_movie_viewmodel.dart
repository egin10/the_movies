import 'package:flutter/material.dart';

import '../../../../models/movies/popular_movie_model.dart';
import '../../../../repository/popular_movie_repository.dart';

class PopularMovieViewModel extends ChangeNotifier {
  bool _loading = false;
  PopularMovieModel? _popularMovies;

  bool get loading => _loading;
  PopularMovieModel get popularMovies => _popularMovies ?? PopularMovieModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setPopularMovies(PopularMovieModel? value) {
    _popularMovies = value;
  }

  PopularMovieViewModel() {
    getPopularMovies();
  }

  getPopularMovies() async {
    setLoading(true);

    final response = await PopularMovieRepository.getPopularMovies();
    response.fold(
      (err) => null,
      (res) {
        setPopularMovies(res);
      },
    );

    setLoading(false);
  }
}
