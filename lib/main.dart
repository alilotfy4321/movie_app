// ignore_for_file: unused_local_variable, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/presentation/controller/movie/movie_cubit.dart';
import 'package:movie_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        //----------------movie cubit------1
        BlocProvider(
          create: (context) => MovieCubit(
            basedMovieRepo: MovieRepository(
                baseMovieRemoteDataSource: MovieRemoteDataSource()),
          )..getNowPlayingMovie()..getPopularMovie()..getTopRatedMovie(),
        ),
      //------------------
      ],
      child: const MyApp(),
    ),
  );
}

 

