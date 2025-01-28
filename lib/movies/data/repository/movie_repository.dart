// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_app/core/failur/failur.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/domain/repository/based_movie_repository.dart';

class MovieRepository extends BasedMovieRepository {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepository({
    required this.baseMovieRemoteDataSource,
  });

  @override
  Future<Either<Failur, List<MovieModel>>> getNowPlayMovies() async {
    try {
      final  result = await baseMovieRemoteDataSource.getNowPlayMovies();
      return Right(result);
    } on ServerExeption catch (e) {
    return  left(ServerExeption(e.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<MovieModel>>> getPopularMovies() async{
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerExeption catch (e) {
    return  left(ServerExeption(e.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<MovieModel>>> getTopRatedMovies()async {
      try {
      final  result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerExeption catch (e) {
    return  left(ServerExeption(e.errorMessage));
    }
  }
}
