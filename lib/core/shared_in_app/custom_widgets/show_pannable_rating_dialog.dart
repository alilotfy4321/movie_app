import 'package:flutter/material.dart';

import 'package:movie_app/movies/presentation/controller/movie/movie_cubit.dart';

void showRatingDialog(BuildContext context, MovieCubit cubit) {

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Rate the Movie"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select your rating:"),
                  GestureDetector(
                    onPanUpdate: (details) {
                      final width = MediaQuery.of(context).size.width;
                      setState(() {
                        // Calculate star rating based on touch position
                        cubit.rating = (details.localPosition.dx / (width / 6)).clamp(0, 5).toDouble();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < cubit.rating ? Icons.star : Icons.star_border,
                          size: 40,
                          color: Colors.amber,
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Your Rating: ${cubit.rating.toStringAsFixed(1)}"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    //_showConfirmation(context, _rating);
                  },
                  child: Text("Submit"),
                ),
              ],
            );
          },
        );
      },
    );
  
}
