import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoint.dart';
import '../../models/tv/top_rated_tv_show_model.dart';
import '../../services/dio_service.dart';

class TopRatedTvShowRepository {
  static Future<Either<dynamic, TopRatedTvShowModel>>
      getTopRatedTvShows() async {
    final dio = DioService.initInstance();

    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };

      final res = await dio.get(
        Endpoint.getTopRatedTv,
        options: Options(headers: headers),
      );

      if (res.statusCode == 200) {
        return Right(TopRatedTvShowModel.fromJson(json.decode(res.toString())));
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
