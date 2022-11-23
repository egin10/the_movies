import 'package:flutter/material.dart';

import '../../../../models/tv/airing_today_tv_show_model.dart';
import '../../../../repository/tv_shows/airing_today_tv_show_repository.dart';

class AiringTodayTvShowViewModel extends ChangeNotifier {
  bool _loading = false;
  AiringTodayTvShowModel? _airingTodayTvShows;

  bool get loading => _loading;
  AiringTodayTvShowModel get airingTodayTvShows =>
      _airingTodayTvShows ?? AiringTodayTvShowModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setAiringTodayTvShows(AiringTodayTvShowModel? value) {
    _airingTodayTvShows = value;
  }

  AiringTodayTvShowViewModel() {
    getAiringTodayTvShows();
  }

  getAiringTodayTvShows() async {
    setLoading(true);

    final response = await AiringTodayTvShowRepository.getAiringTodayTvShows();
    response.fold(
      (err) => null,
      (res) {
        setAiringTodayTvShows(res);
      },
    );

    setLoading(false);
  }
}
