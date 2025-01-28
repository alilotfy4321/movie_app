// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/shared_in_app/end_points.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider(this.list);
  final List<MovieEntity> list;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: list.map((item) {
        return Stack(
          children: [
            Container(
              //margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:
                      NetworkImage('${EndPoints.imageBaseUrl}${item.backdropPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  ),
                height: 50,
                width: double.infinity,
                child: Center(child: Text(item.name,style:
                 TextStyle(fontSize: 22,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,)),
              ),
            ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        height: 250,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
