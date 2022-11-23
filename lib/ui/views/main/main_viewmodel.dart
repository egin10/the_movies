import 'package:flutter/material.dart';

import '../../../models/movies/now_playing_movie_model.dart';
import '../../../models/movies/popular_movie_model.dart';
import '../../../models/movies/top_rated_movie_model.dart';
import '../../../models/movies/upcoming_movie_model.dart';
import '../../../repository/now_playing_movie_repository.dart';
import '../../../repository/popular_movie_repository.dart';
import '../../../repository/top_rated_movie_repository.dart';
import '../../../repository/upcoming_movie_repository.dart';

class MainViewModel extends ChangeNotifier {
  final List<String> _menus = [
    'Movies',
    'TV Shows',
    'People',
  ];
  int _menuIndex = 0;

  List<String> get menus => _menus;
  int get menuIndex => _menuIndex;

  NowPlayingMovieModel? _nowPlayingMovies;
  TopRatedMovieModel? _topRatedMovies;
  UpcomingMovieModel? _upcomingMovies;
  PopularMovieModel? _popularMovies;
  NowPlayingMovieModel get nowPlayingMovies =>
      _nowPlayingMovies ?? NowPlayingMovieModel();
  TopRatedMovieModel get topRatedMovies =>
      _topRatedMovies ?? TopRatedMovieModel();
  UpcomingMovieModel get upcomingMovies =>
      _upcomingMovies ?? UpcomingMovieModel();
  PopularMovieModel get popularMovies => _popularMovies ?? PopularMovieModel();

  setMenuIndex(int value) {
    _menuIndex = value;
    notifyListeners();
  }

  setNowPlayingMovies(NowPlayingMovieModel? value) {
    _nowPlayingMovies = value;
  }

  setTopRatedMovies(TopRatedMovieModel? value) {
    _topRatedMovies = value;
  }

  setUpcomingMovies(UpcomingMovieModel? value) {
    _upcomingMovies = value;
  }

  setPopularMovies(PopularMovieModel? value) {
    _popularMovies = value;
  }

  getNowPlayingMovies() async {
    final response = await NowPlayingMovieRepository.getNowPlayingMovies();
    response.fold(
      (err) => null,
      (res) async {
        await setNowPlayingMovies(res);
      },
    );
    notifyListeners();
  }

  getTopRatedMovies() async {
    final response = await TopRatedMovieRepository.getTopRatedMovies();
    response.fold(
      (err) => null,
      (res) {
        setTopRatedMovies(res);
      },
    );
    notifyListeners();
  }

  getUpcomingMovies() async {
    final response = await UpcomingMovieRepository.getUpcomingMovies();
    response.fold(
      (err) => null,
      (res) {
        setUpcomingMovies(res);
      },
    );
    notifyListeners();
  }

  getPopularMovies() async {
    final response = await PopularMovieRepository.getPopularMovies();
    response.fold(
      (err) => null,
      (res) {
        setPopularMovies(res);
      },
    );
    notifyListeners();
  }

  MainViewModel() {
    getNowPlayingMovies();
    getTopRatedMovies();
    getUpcomingMovies();
    getPopularMovies();
  }
}
