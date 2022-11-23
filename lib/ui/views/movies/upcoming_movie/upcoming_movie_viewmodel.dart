import 'package:flutter/material.dart';

import '../../../../models/movies/upcoming_movie_model.dart';
import '../../../../repository/upcoming_movie_repository.dart';

class UpcomingMovieViewModel extends ChangeNotifier {
  bool _loading = false;
  UpcomingMovieModel? _upcomingMovies;

  bool get loading => _loading;
  UpcomingMovieModel get upcomingMovies =>
      _upcomingMovies ?? UpcomingMovieModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setUpcomingMovies(UpcomingMovieModel? value) {
    _upcomingMovies = value;
  }

  UpcomingMovieViewModel() {
    getUpcomingMovies();
  }

  getUpcomingMovies() async {
    setLoading(true);

    final response = await UpcomingMovieRepository.getUpcomingMovies();
    response.fold(
      (err) => null,
      (res) {
        setUpcomingMovies(res);
      },
    );

    setLoading(false);
  }
}
