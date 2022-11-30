import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../constants/endpoint.dart';
import '../../models/movies/now_playing_movie_model.dart';
import '../../services/dio_service.dart';

class NowPlayingMovieRepository {
  static Future<Either<dynamic, NowPlayingMovieModel>>
      getNowPlayingMovies() async {
    final dio = DioService.initInstance();

    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };

      final res = await dio.get(
        Endpoint.getNowPlayingMovie,
        options: Options(headers: headers),
      );

      if (res.statusCode == 200) {
        return Right(
            NowPlayingMovieModel.fromJson(json.decode(res.toString())));
      } else {
        return Left(res);
      }
    } on DioError catch (e, stackTrace) {
      await Sentry.captureException(
        e,
        stackTrace: stackTrace,
      );

      return Left(
        {'status': e.response?.statusMessage.toString(), 'msg': e.toString()},
      );
    }
  }
}
