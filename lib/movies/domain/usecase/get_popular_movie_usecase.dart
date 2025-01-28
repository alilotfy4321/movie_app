import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failur/failur.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/repository/based_movie_repository.dart';

class GetPopularMovie {
  BasedMovieRepository basedMovieRepo;
  GetPopularMovie({required this.basedMovieRepo});
  Future<Either<Failur, List<MovieEntity>>> execute() async {
  return  await basedMovieRepo.getPopularMovies();
  }
}