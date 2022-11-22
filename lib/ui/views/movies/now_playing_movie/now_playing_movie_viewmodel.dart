import 'package:flutter/material.dart';

import '../../../../models/movies/now_playing_movie_model.dart';
import '../../../../repository/now_playing_movie_repository.dart';

class NowPlayingMovieViewModel extends ChangeNotifier {
  bool _loading = false;
  NowPlayingMovieModel? _topRatedMovies;

  bool get loading => _loading;
  NowPlayingMovieModel get topRatedMovies =>
      _topRatedMovies ?? NowPlayingMovieModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setTopRatedMovies(NowPlayingMovieModel? value) {
    _topRatedMovies = value;
  }

  NowPlayingMovieViewModel() {
    getTopRatedMovies();
  }

  getTopRatedMovies() async {
    setLoading(true);

    final response = await NowPlayingMovieRepository.getNowPlayingMovies();
    response.fold(
      (err) => null,
      (res) {
        setTopRatedMovies(res);
      },
    );

    setLoading(false);
  }
}
