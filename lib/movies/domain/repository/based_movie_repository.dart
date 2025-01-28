import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failur/failur.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

abstract class BasedMovieRepository {
  Future<Either<Failur, List<MovieEntity>>> getNowPlayMovies();
  Future<Either<Failur, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failur, List<MovieEntity>>> getTopRatedMovies();
}
