// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/repository/based_movie_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_play_now_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movie_usecase.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieStates> {
  final BasedMovieRepository basedMovieRepo;
  MovieCubit({required this.basedMovieRepo}) : super(MovieInitialState());
  //---------------------------------instance
  static MovieCubit get(context) => BlocProvider.of(context);
  //-------------------------------------------now playing list---
  List<MovieEntity> nowPlayingMoviesList = [];

  Future<void> getNowPlayingMovie() async {
    emit(MovieNowPlayingLoadingState());
    final results =
        await GetNowPlayingMovie(basedMovieRepo: basedMovieRepo).execute();
    results.fold(
      (failure) {
        emit(MovieNowPlayingErrorState(failure.errorMessage));
      },
      (movies) {
        nowPlayingMoviesList = movies;
        print(nowPlayingMoviesList.toString());
        emit(MovieNowPlayingSuccessState(movies));
      },
    );
  }

  //-------------------------------------------popular---
  List<MovieEntity> popularMoviesList = [];

  Future<void> getPopularMovie() async {
    emit(PopularMoviesLoadingState());
    final results =
        await GetPopularMovie(basedMovieRepo: basedMovieRepo).execute();
    results.fold(
      (failure) {
        emit(PopularMoviesErrorState(failure.errorMessage));
      },
      (movies) {
        popularMoviesList = movies;
        print(nowPlayingMoviesList.toString());
        emit(PopularMoviesSuccesState(movies));
      },
    );
  }

  //-------------------------------------------top rated---
  List<MovieEntity> topRatedMoviesList = [];

  Future<void> getTopRatedMovie() async {
    emit(PopularMoviesLoadingState());
    final results =
        await GetTopRatedMovie(basedMovieRepo: basedMovieRepo).execute();
    results.fold(
      (failure) {
        emit(PopularMoviesErrorState(failure.errorMessage));
      },
      (movies) {
        topRatedMoviesList = movies;
        print(nowPlayingMoviesList.toString());
        emit(PopularMoviesSuccesState(movies));
      },
    );
  }

//-----------categories list
  List<String> categorieList = [
    'All',
    'Action',
    'Comedy',
    'Romantic',
  ];
//-------------categories list index color
  int categoriesListIndex = 0;
  void changeCategoriesListIndex(int index) {
    categoriesListIndex = index;
    emit(ChangeCategoriesListIndexState());
  }

  //-----star rating
  double rating = 0.0;
  void changeStarRating(double value) {
    rating = value;
    emit(ChangeRatingState());
  }
}
