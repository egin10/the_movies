import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoint.dart';
import '../../models/movies/top_rated_movie_model.dart';
import '../../services/dio_service.dart';

class TopRatedMovieRepository {
  static Future<Either<dynamic, TopRatedMovieModel>> getTopRatedMovies() async {
    final dio = DioService.initInstance();

    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };

      final res = await dio.get(
        Endpoint.getTopRatedMovie,
        options: Options(headers: headers),
      );

      if (res.statusCode == 200) {
        return Right(TopRatedMovieModel.fromJson(json.decode(res.toString())));
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
