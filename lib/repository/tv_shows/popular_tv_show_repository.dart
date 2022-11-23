import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoint.dart';
import '../../models/tv/popular_tv_show_model.dart';
import '../../services/dio_service.dart';

class PopularTvShowRepository {
  static Future<Either<dynamic, PopularTvShowModel>> getPopularTvShows() async {
    final dio = DioService.initInstance();

    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };

      final res = await dio.get(
        Endpoint.getPopularTv,
        options: Options(headers: headers),
      );

      if (res.statusCode == 200) {
        return Right(PopularTvShowModel.fromJson(json.decode(res.toString())));
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
