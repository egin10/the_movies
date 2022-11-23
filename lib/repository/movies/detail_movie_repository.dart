import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoint.dart';
import '../../models/movies/detail_movie_model.dart';
import '../../services/dio_service.dart';

class DetailMovieRepository {
  static Future<Either<dynamic, DetailMovieModel>> getDetailMovie(
      String id) async {
    final dio = DioService.initInstance();

    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };

      final res = await dio.get(
        Endpoint.getDetailMovie.replaceAll('%ID%', id),
        options: Options(headers: headers),
      );

      if (res.statusCode == 200) {
        return Right(DetailMovieModel.fromJson(json.decode(res.toString())));
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
