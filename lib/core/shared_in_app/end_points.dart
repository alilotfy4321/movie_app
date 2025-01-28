// ignore_for_file: unnecessary_brace_in_string_interps

class EndPoints {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "03dce094baaa2d92162eaa3eac9e1372";
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String nowPlayingMovie =
      "${baseUrl}/movie/now_playing?api_key=${apiKey}";
  static const String popularMovies =
      "${baseUrl}/movie/popular?api_key=${apiKey}";
  static const String topRatedMovies =
      "${baseUrl}/movie/top_rated?api_key=${apiKey}";
}

