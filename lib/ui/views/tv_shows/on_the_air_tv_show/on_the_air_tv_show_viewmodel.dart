import 'package:flutter/material.dart';

import '../../../../models/tv/on_the_air_tv_show_model.dart';
import '../../../../repository/tv_shows/on_the_air_tv_show_repository.dart';

class OnTheAirTvShowViewModel extends ChangeNotifier {
  bool _loading = false;
  OnTheAirTvShowModel? _onTheAirTvShows;

  bool get loading => _loading;
  OnTheAirTvShowModel get onTheAirTvShows =>
      _onTheAirTvShows ?? OnTheAirTvShowModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setOnTheAirTvShows(OnTheAirTvShowModel? value) {
    _onTheAirTvShows = value;
  }

  OnTheAirTvShowViewModel() {
    getOnTheAirTvShows();
  }

  getOnTheAirTvShows() async {
    setLoading(true);

    final response = await OnTheAirTvShowRepository.getOnTheAirTvShows();
    response.fold(
      (err) => null,
      (res) {
        setOnTheAirTvShows(res);
      },
    );

    setLoading(false);
  }
}
