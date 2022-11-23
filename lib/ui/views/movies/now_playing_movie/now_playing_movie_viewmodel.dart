import 'package:flutter/material.dart';

import '../../../../models/movies/now_playing_movie_model.dart';
import '../../../../repository/now_playing_movie_repository.dart';

class NowPlayingMovieViewModel extends ChangeNotifier {
  bool _loading = false;
  NowPlayingMovieModel? _nowPlayingMovies;

  bool get loading => _loading;
  NowPlayingMovieModel get nowPlayingMovies =>
      _nowPlayingMovies ?? NowPlayingMovieModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setNowPlayingMovies(NowPlayingMovieModel? value) {
    _nowPlayingMovies = value;
  }

  NowPlayingMovieViewModel() {
    getNowPlayingMovies();
  }

  getNowPlayingMovies() async {
    setLoading(true);

    final response = await NowPlayingMovieRepository.getNowPlayingMovies();
    response.fold(
      (err) => null,
      (res) {
        setNowPlayingMovies(res);
      },
    );

    setLoading(false);
  }
}
