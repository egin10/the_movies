import 'package:flutter/material.dart';

import '../../../../models/tv/popular_tv_show_model.dart';
import '../../../../repository/tv_shows/popular_tv_show_repository.dart';

class PopularTvShowViewModel extends ChangeNotifier {
  bool _loading = false;
  PopularTvShowModel? _popularTvShows;

  bool get loading => _loading;
  PopularTvShowModel get popularTvShows =>
      _popularTvShows ?? PopularTvShowModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setPopularTvShows(PopularTvShowModel? value) {
    _popularTvShows = value;
  }

  PopularTvShowViewModel() {
    getPopularTVShows();
  }

  getPopularTVShows() async {
    setLoading(true);

    final response = await PopularTvShowRepository.getPopularTvShows();
    response.fold(
      (err) => null,
      (res) {
        setPopularTvShows(res);
      },
    );

    setLoading(false);
  }
}
