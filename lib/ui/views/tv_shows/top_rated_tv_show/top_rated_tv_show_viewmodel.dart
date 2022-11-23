import 'package:flutter/material.dart';

import '../../../../models/tv/top_rated_tv_show_model.dart';
import '../../../../repository/tv_shows/top_rated_tv_show_repository.dart';

class TopRatedTvShowViewModel extends ChangeNotifier {
  bool _loading = false;
  TopRatedTvShowModel? _topRatedTvShows;

  bool get loading => _loading;
  TopRatedTvShowModel get topRatedTvShows =>
      _topRatedTvShows ?? TopRatedTvShowModel();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setTopRatedTvShows(TopRatedTvShowModel? value) {
    _topRatedTvShows = value;
  }

  TopRatedTvShowViewModel() {
    getTopRatedTvShows();
  }

  getTopRatedTvShows() async {
    setLoading(true);

    final response = await TopRatedTvShowRepository.getTopRatedTvShows();
    response.fold(
      (err) => null,
      (res) {
        setTopRatedTvShows(res);
      },
    );

    setLoading(false);
  }
}
