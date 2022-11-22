import 'package:flutter/material.dart';

import '../../../../models/movies/upcoming_movie_model.dart';
import '../../../../repository/upcoming_movie_repository.dart';

class UpcomingMovieViewModel extends ChangeNotifier {
  bool _loading = false;
  UpcomingMovieModel? _topRatedMovies;

  bool get loading => _loading;
  UpcomingMovieModel get topRatedMovies =>
      _topRatedMovies ?? UpcomingMovieModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setTopRatedMovies(UpcomingMovieModel? value) {
    _topRatedMovies = value;
  }

  UpcomingMovieViewModel() {
    getTopRatedMovies();
  }

  getTopRatedMovies() async {
    setLoading(true);

    final response = await UpcomingMovieRepository.getUpcomingMovies();
    response.fold(
      (err) => null,
      (res) {
        setTopRatedMovies(res);
      },
    );

    setLoading(false);
  }
}
