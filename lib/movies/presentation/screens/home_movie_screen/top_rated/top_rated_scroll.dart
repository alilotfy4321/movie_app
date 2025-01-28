// ignore_for_file: unnecessary_string_interpolations, avoid_print, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/shared_in_app/app_strings.dart';
import 'package:movie_app/core/shared_in_app/custom_widgets/show_pannable_rating_dialog.dart';
import 'package:movie_app/core/shared_in_app/end_points.dart';
import 'package:movie_app/movies/presentation/controller/movie/movie_cubit.dart';

class TopRatedScrollPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
            cubit.topRatedMoviesList.length,
              (index) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                ),
                height: 340,
                width: 150,
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-----------------1
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '${EndPoints.imageBaseUrl}${cubit.topRatedMoviesList[index].backdropPath},'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    //--------------------2

                    Padding(
                      //2.1
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            '${cubit.topRatedMoviesList[index].voteAverage.toStringAsFixed(1)}',
                            style: TextTheme.of(context).displaySmall,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: IconButton(
                              onPressed: () {
                                //print('vote');
                                //----------------dialog rating
                                showRatingDialog(context, cubit);
                              },
                              icon: Icon(
                                Icons.star_border_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //----------movie name
                    SizedBox(
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                          '${cubit.topRatedMoviesList[index].name}',
                          style: TextTheme.of(context).displayMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('${AppStrings.watchNow}'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
