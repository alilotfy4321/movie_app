import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screens/home_movie_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 2, 42, 77),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          displayMedium:TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          displaySmall:TextStyle(
            color: Colors.white,
            fontSize: 16,
          ), 
        ),
      ),
      
      home: HomeScreen(),
    );
  }
}
