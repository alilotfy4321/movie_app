// ignore_for_file: avoid_print, unused_local_variable, use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/shared_in_app/app_strings.dart';
import 'package:movie_app/core/shared_in_app/custom_widgets/carusal_slider.dart';
import 'package:movie_app/core/shared_in_app/custom_widgets/navigation.dart';
import 'package:movie_app/movies/presentation/controller/movie/movie_cubit.dart';
import 'package:movie_app/movies/presentation/screens/home_movie_screen/popular_movies/ppoular_scroll.dart';
import 'package:movie_app/movies/presentation/screens/home_movie_screen/see_all_movie.dart';
import 'package:movie_app/movies/presentation/screens/home_movie_screen/top_rated/top_rated_scroll.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        
        var cubit = MovieCubit.get(context);
        var nowPlayingList = cubit.nowPlayingMoviesList;
        var popularList = cubit.popularMoviesList;
        var topRatedList = cubit.topRatedMoviesList;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor:
                Colors.transparent, // Makes AppBar background transparent
            elevation: 0, // Removes AppBar shadow
            iconTheme: const IconThemeData(
              color: Colors.white, // Set AppBar icons to white
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Carousel Slider now playing movies---
                CustomSlider(nowPlayingList),
                //---------categories-----
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    '${AppStrings.categories}',
                    style: TextTheme.of(context).displayLarge,
                  ),
                ),
                //--------------row categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    cubit.categorieList.length,
                      (index) => InkWell(
                            onTap: ()async {
                              cubit.changeCategoriesListIndex(index);
                              
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                //----change the categorie color
                                color: (index == cubit.categoriesListIndex)
                                    ? Colors.red
                                    : Colors.grey[600],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    cubit.categorieList[index],
                                    style: TextTheme.of(context).displayMedium,
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
                //-----popularmovies
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppStrings.popular}',
                        style: TextTheme.of(context).displayLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(
                            context,
                            SeeAllPopularMovies(movieList: popularList),
                          );
                        },
                        child: Text(
                          '${AppStrings.seeAll}',
                          style: TextTheme.of(context)
                              .bodyMedium!
                              .copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                PopularScrollPart(),
                //---------------------top rated movies
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppStrings.topRated}',
                        style: TextTheme.of(context).displayLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(
                            context,
                            SeeAllPopularMovies(movieList: topRatedList),
                          );
                        },
                        child: Text(
                          '${AppStrings.seeAll}',
                          style: TextTheme.of(context)
                              .bodyMedium!
                              .copyWith(color: Colors.red),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                    //--toprated scroll part
                  TopRatedScrollPart(),
                  SizedBox(height: 20,),
              ],
            ),
          ),
        );
      },
    );
  }
}
