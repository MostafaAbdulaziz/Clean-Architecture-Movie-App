class Apis {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '160bc11ab739cf897a283b3574504a70';
  static const String movieSession = 'movie';
  static const String nowPlayingEndpoint = 'now_playing';
  static const String popularEndpoint = 'popular';
  static const String topRatedEndpoint = 'top_rated';

  static const String newPlayingApi =
      '$baseUrl/$movieSession/$nowPlayingEndpoint?api_key=$apiKey';
  static const String popularApi =
      '$baseUrl/$movieSession/$popularEndpoint?api_key=$apiKey';
  static const String topRatedApi =
      '$baseUrl/$movieSession/$topRatedEndpoint?api_key=$apiKey';
  static String movieId = '';

  ///هنا كان فيه مشكلة ان ال movieId بيتغير لكن ميتغيرش فى movieDetailsApi و لا فى recommendationsMovieApi و انا عامل الكود الخطأ comments
  //  static String movieDetailsApi =
  //       '$baseUrl/$movieSession/$movieId?api_key=$apiKey';
  //   static String recommendationsMovieApi =
  //       '$baseUrl/$movieSession/$movieId/recommendations?api_key=$apiKey';
  static String movieDetailsApi(String movieId) =>
      '$baseUrl/$movieSession/$movieId?api_key=$apiKey';
  static String recommendationsMovieApi(String movieId) =>
      '$baseUrl/$movieSession/$movieId/recommendations?api_key=$apiKey';
  static const String baseImageUrl = 'https://images.tmdb.org/t/p/w500';
  static String getImageUrl(String imagePath) => '$baseImageUrl$imagePath';
}
