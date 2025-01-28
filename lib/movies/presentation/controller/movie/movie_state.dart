part of 'movie_cubit.dart';

abstract class MovieStates {}

class MovieInitialState extends MovieStates {}

//---------------now playing
class MovieNowPlayingLoadingState extends MovieStates {}

class MovieNowPlayingSuccessState extends MovieStates {
  List<MovieEntity> movies;
  MovieNowPlayingSuccessState(this.movies);
}

class MovieNowPlayingErrorState extends MovieStates {
  final Failur;
  MovieNowPlayingErrorState(this.Failur);

}

//---------------popular movies
class PopularMoviesLoadingState extends MovieStates {}

class PopularMoviesSuccesState extends MovieStates {
  List<MovieEntity> movies;
  PopularMoviesSuccesState(this.movies);
}

class PopularMoviesErrorState extends MovieStates {
  final Failur;
  PopularMoviesErrorState(this.Failur);
  
}

//---------------top rated
class TopRatedLoadingState extends MovieStates {}

class TopRatedSuccessState extends MovieStates {
  List<MovieEntity> movies;
  TopRatedSuccessState(this.movies);
}

class TopRatedErrorState extends MovieStates {
  final Failur;
  TopRatedErrorState(this.Failur);
  
}
class ChangeCategoriesListIndexState extends MovieStates {}
class ChangeRatingState extends MovieStates {}


