// ignore_for_file: avoid_print, annotate_overrides

import 'package:dio/dio.dart';
import 'package:movie_app/core/shared_in_app/end_points.dart';
import 'package:movie_app/core/failur/failur.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  //contract between any classes
  Future<List<MovieModel>> getNowPlayMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

//-------concrete class implementaion
class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  //------------now playing list
  @override
  Future<List<MovieModel>> getNowPlayMovies() async {
    List<MovieModel> nowPlayMoviesList = [];
    try {
      final response = await Dio().get(EndPoints.nowPlayingMovie);
      if (response.statusCode == 200) {
        response.data['results'].forEach((v) {
          nowPlayMoviesList.add(MovieModel.fromJson(v));
        });
      } else {
        // Handle non-200 status codes
        print('Error: ${response.statusCode}');
      }
    } on Failur catch (e) {
      throw ServerExeption(e.errorMessage);
    }
    return nowPlayMoviesList;
  }
  //------------now playing list
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> popularMoviesList = [];
    try {
      final response = await Dio().get(EndPoints.popularMovies);
      if (response.statusCode == 200) {
        response.data['results'].forEach((v) {
          popularMoviesList.add(MovieModel.fromJson(v));
        });
      }
    } on Failur catch (e) {
      ServerExeption(e.errorMessage);
    }
    return popularMoviesList;
  }

//------------------------top rated movie
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    List<MovieModel> topRatedMoviesList = [];
    try {
      final response = await Dio().get(EndPoints.topRatedMovies);
      if (response.statusCode == 200) {
        response.data['results'].forEach((v) {
          topRatedMoviesList.add(MovieModel.fromJson(v));
        });
      }
      print(topRatedMoviesList);
    } on Exception catch (e) {
      print(e.toString());
    }
    return topRatedMoviesList;
  }
}
