import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoint.dart';
import '../../models/tv/airing_today_tv_show_model.dart';
import '../../services/dio_service.dart';

class AiringTodayTvShowRepository {
  static Future<Either<dynamic, AiringTodayTvShowModel>>
      getAiringTodayTvShows() async {
    final dio = DioService.initInstance();

    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };

      final res = await dio.get(
        Endpoint.getAiringTodayTv,
        options: Options(headers: headers),
      );

      if (res.statusCode == 200) {
        return Right(
            AiringTodayTvShowModel.fromJson(json.decode(res.toString())));
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
