// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:movie_app/core/shared_in_app/app_strings.dart';
import 'package:movie_app/core/shared_in_app/end_points.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

class SeeAllPopularMovies extends StatelessWidget {
  List<MovieEntity> movieList;
  SeeAllPopularMovies({required this.movieList, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${AppStrings.allTopRatedMovies}',style: TextTheme.of(context).displayLarge,),
        backgroundColor: const Color.fromARGB(31, 1, 2, 44),
        iconTheme: IconThemeData(color: Colors.white,),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
          childAspectRatio: 2 / 2, // Aspect ratio of each item
        ),
        itemCount: 20, // Number of items
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(
                        '${EndPoints.imageBaseUrl}${movieList[index].backdropPath}',),fit: BoxFit.cover,),
              ),
            
            ),
          );
        },
      ),
    );
  }
}
