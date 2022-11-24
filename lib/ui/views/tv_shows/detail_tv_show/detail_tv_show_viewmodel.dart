import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/tv/detail_tv_show_model.dart';
import '../../../../repository/tv_shows/detail_tv_show_repository.dart';

class DetailTvShowViewModel extends ChangeNotifier {
  DetailTvShowModel? _detailTvShow;

  DetailTvShowModel get detailTvShow => _detailTvShow ?? DetailTvShowModel();

  setDetailTvShow(DetailTvShowModel? value) {
    _detailTvShow = value;
  }

  Future<void> getDetailTvShow(String id) async {
    final response = await DetailTvShowRepository.getDetailTvShow(id);
    response.fold(
      (err) => null,
      (res) {
        setDetailTvShow(res);
      },
    );
  }

  Future<void> openHomepage(String url) async {
    if (url.isNotEmpty) {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    }
  }
}
