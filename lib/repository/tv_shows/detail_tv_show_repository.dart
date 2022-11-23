import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoint.dart';
import '../../models/tv/detail_tv_show_model.dart';
import '../../services/dio_service.dart';

class DetailTvShowRepository {
  static Future<Either<dynamic, DetailTvShowModel>> getAiringTodayTvShows(
      String id) async {
    final dio = DioService.initInstance();

    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };

      final res = await dio.get(
        Endpoint.getDetailTv.replaceAll('%ID', id),
        options: Options(headers: headers),
      );

      if (res.statusCode == 200) {
        return Right(DetailTvShowModel.fromJson(json.decode(res.toString())));
      } else {
        return Left(res);
      }
    } on DioError catch (e) {
      return Left(
        {'status': e.response?.statusMessage.toString(), 'msg': e.toString()},
      );
    }
  }
}
