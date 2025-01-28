import 'package:movie_app/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      name: json['title'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from((json['genre_ids'])),
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date']);

  @override
  String toString() {
    return 'MovieModel{id: $id, name: $name,backdropPath:$backdropPath,genreIds:$genreIds, releaseDate: $releaseDate, voteAverage: $voteAverage}';
  }
}
