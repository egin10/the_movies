import 'package:flutter/material.dart';

import '../../../models/movies/now_playing_movie_model.dart';
import '../../../models/movies/popular_movie_model.dart';
import '../../../models/movies/top_rated_movie_model.dart';
import '../../../models/movies/upcoming_movie_model.dart';
import '../../../models/tv/airing_today_tv_show_model.dart';
import '../../../models/tv/on_the_air_tv_show_model.dart';
import '../../../models/tv/popular_tv_show_model.dart';
import '../../../models/tv/top_rated_tv_show_model.dart';
import '../../../repository/movies/now_playing_movie_repository.dart';
import '../../../repository/movies/popular_movie_repository.dart';
import '../../../repository/movies/top_rated_movie_repository.dart';
import '../../../repository/movies/upcoming_movie_repository.dart';
import '../../../repository/tv_shows/airing_today_tv_show_repository.dart';
import '../../../repository/tv_shows/on_the_air_tv_show_repository.dart';
import '../../../repository/tv_shows/popular_tv_show_repository.dart';
import '../../../repository/tv_shows/top_rated_tv_show_repository.dart';

class MainViewModel extends ChangeNotifier {
  final List<String> _menus = [
    'Movies',
    'TV Shows',
    'People',
  ];
  int _menuIndex = 0;
  final _pageController = PageController();

  List<String> get menus => _menus;
  int get menuIndex => _menuIndex;

  PageController get pageController => _pageController;

  // Movies
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

  // TV Shows
  TopRatedTvShowModel? _topRatedTvShows;
  PopularTvShowModel? _popularTvShows;
  OnTheAirTvShowModel? _onTheAirTvShows;
  AiringTodayTvShowModel? _airingTodayTvShows;
  TopRatedTvShowModel get topRatedTvShows =>
      _topRatedTvShows ?? TopRatedTvShowModel();
  PopularTvShowModel get popularTvShows =>
      _popularTvShows ?? PopularTvShowModel();
  OnTheAirTvShowModel get onTheAirTvShows =>
      _onTheAirTvShows ?? OnTheAirTvShowModel();
  AiringTodayTvShowModel get airingTodayTvShows =>
      _airingTodayTvShows ?? AiringTodayTvShowModel();

  setMenuIndex(int index) {
    _menuIndex = index;
    notifyListeners();
  }

  updateMenuIndex(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
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

  setTopRatedTvShows(TopRatedTvShowModel? value) {
    _topRatedTvShows = value;
  }

  setPopularTvShows(PopularTvShowModel? value) {
    _popularTvShows = value;
  }

  setOnTheAirTvShows(OnTheAirTvShowModel? value) {
    _onTheAirTvShows = value;
  }

  setAiringTodayTvShows(AiringTodayTvShowModel? value) {
    _airingTodayTvShows = value;
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

  getTopRatedTvShows() async {
    final response = await TopRatedTvShowRepository.getTopRatedTvShows();
    response.fold(
      (err) => null,
      (res) {
        setTopRatedTvShows(res);
      },
    );
    notifyListeners();
  }

  getPopularTVShows() async {
    final response = await PopularTvShowRepository.getPopularTvShows();
    response.fold(
      (err) => null,
      (res) {
        setPopularTvShows(res);
      },
    );
    notifyListeners();
  }

  getOnTheAirTvShows() async {
    final response = await OnTheAirTvShowRepository.getOnTheAirTvShows();
    response.fold(
      (err) => null,
      (res) {
        setOnTheAirTvShows(res);
      },
    );
    notifyListeners();
  }

  getAiringTodayTvShows() async {
    final response = await AiringTodayTvShowRepository.getAiringTodayTvShows();
    response.fold(
      (err) => null,
      (res) {
        setAiringTodayTvShows(res);
      },
    );
    notifyListeners();
  }

  MainViewModel() {
    _pageController.addListener(
      () => setMenuIndex(_pageController.page!.toInt()),
    );
    getNowPlayingMovies();
    getTopRatedMovies();
    getUpcomingMovies();
    getPopularMovies();
    getTopRatedTvShows();
    getPopularTVShows();
    getOnTheAirTvShows();
    getAiringTodayTvShows();
  }
}
